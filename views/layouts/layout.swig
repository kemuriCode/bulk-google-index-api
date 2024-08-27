<!DOCTYPE html>
<html lang="pl">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Marcin Dymek" />
    {% block meta %}
      <title>Fast Indexing</title>
      <meta name="description" content="Indexing API dla firmy Brainbox. Szybkie i łatwe wysyłanie adresów URL do Google Search Console." />
    {% endblock %}
    {% block head %}
      {% include "../main/partials/head.swig" %}
    {% endblock %}
  </head>

  <body>

    <div class="header">
      {% include "../main/partials/header.swig" %}
    </div>

    <div class="content">
      {% block content %}{% endblock %}
    </div>

    {% include "../main/partials/footer.swig" %}

  </body>

</html>
