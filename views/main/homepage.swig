{% extends "../layouts/layout.swig" %}

{% block content %}

  <div class="container">

    {% if sails.config.globals.google_api_key == "" || sails.config.globals.google_client_id == "" || sails.config.globals.google_client_secret == "" %}

      <p>
        Aby wysyłać żądania za pomocą narzędzia, należy skonfigurować plik <code>/config/globals.js</code> uzupełniając poniższe pola:
      </p>
      <ul>
        <li>google_api_key</li>
        <li>google_client_id</li>
        <li>google_client_id</li>
      </ul>
      <p>
        Jak zdobyć klucz API? Dokładną instrukcję znajdziesz w tym <a href="https://toponline.pl/blog/google-indexing-api" target="_blank">artykule</a>.
      </p>

    {% else %}

      {% if req.session.tokens.access_token %}

        {% if req.method == "POST" %}
          <div class="row fs-6 pb-4">
            <div class="col-4">
              <a href="/"><i class="fa-solid fa-left-long me-2"></i> Powrót do formularza</a>
            </div>
            <div class="col-8 text-end">
              Legenda:
              <span class="ms-2"><i class="fa-solid fa-circle-notch fa-spin"></i> Oczekuje na wysłanie</span>
              <span class="ms-2"><i class="fa-solid fa-circle-check text-primary"></i> Wysłano poprawnie</span>
              <span class="ms-2"><i class="fa-solid fa-circle-xmark text-success"></i> Wystąpił błąd</span>
            </div>
          </div>
          <div class="bg-gray p-5" id="results">
            <p>
              Ilość przesłanych adresów URL: <strong>{{ urls.length }}</strong>
            </p>
            {% for url in urls %}
              <div class="row url-row" id="urlRow{{ loop.key }}" url="{{ url }}">
                <div class="col-12 pt-2 pb-2">
                  <span class="icon"><i class="fa-solid fa-circle-notch fa-spin"></i></span> <span class="url ms-3">{{ url }}</span>
                </div>
              </div>
            {% endfor %}
          </div>
          <p class="fs-6 text-muted mt-4">
            Pamiętaj, że do poprawnego wysyłania zgłoszeń konieczne są uprawnienia właściciela strony w Google Search Console. Masz inny problem z aplikacją? Napisz o nim na grupie SEO Samodzielnych. Więcej informacji na temat aplikacji oraz interfejsu Indexing API znajdziesz w <a href="https://toponline.pl/blog/google-indexing-api">tym artykule</a>.
          </p>

          <script type="text/javascript">

            function next(i) {

              $.post("/publish", {
                url: $("#urlRow" + i).attr("url"),
              })
              .done(function(data) {
                $("#urlRow" + i + " .icon").html('<i class="fa-solid fa-circle-check text-primary"></i>');
                i++;
                if (i < $("#results .url-row").length) {
                  next(i);
                }
              })
              .fail(function(e) {
                console.log(e);
                $("#urlRow" + i + " .icon").html('<i class="fa-solid fa-circle-xmark text-success"></i> (' + e.responseJSON.response.code + ')');
                i++;
                if (i < $("#results .url-row").length) {
                  next(i);
                }
              })

            }

            next(0);

          </script>

        {% else %}

          <form action="/" method="post" id="indexingForm">
            <div class="form-group">
              <label for="urls" class="mb-2">Lista adresów URL oddzielona enterami</label>
              <textarea id="urls" name="urls" class="form-control" placeholder="https://adres-twojego-serwisu.pl/podstrona-1
https://adres-twojego-serwisu.pl/inna-podstrona-2
https://adres-twojego-serwisu.pl/jeszcze-inna-podstrona-3"></textarea>
            </div>
            <div class="form-group mt-4">
              <button type="submit" class="btn btn-primary btn-sm">Prześlij</button>
            </div>
          </form>

        {% endif %}

      {% else %}
        <p>
          Aby korzystać z Indexing API musisz wygenerować token. Token zostanie zapisany w sesji.
        </p>
        <p>
          <a href="/google/login" class="btn btn-primary btn-sm">Wygeneruj token</a>
        </p>
      {% endif %}

    {% endif %}

  </div>

{% endblock %}
