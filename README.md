# Bulk Google Index API

![Sails.js](https://img.shields.io/badge/Sails.js-v1.0.0-blue)
![Node.js](https://img.shields.io/badge/Node.js-v20.14.0-green)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

## Opis

Bulk Google Index API to aplikacja webowa zbudowana przy użyciu Sails.js i Node.js, która umożliwia masowe przesyłanie URL-ów do Google Indexing API w celu szybszego ich indeksowania przez wyszukiwarkę Google. 

## Funkcjonalności

- **Masowe indeksowanie URL-ów:** Wprowadź listę URL-ów do zaindeksowania w Google.
- **Integracja z Google API:** Bezpośrednie połączenie z Google Indexing API.
- **Interfejs użytkownika:** Prosty i intuicyjny interfejs do zarządzania i przesyłania URL-ów.

## Wymagania

- Node.js v20.14.0+
- NPM (Node Package Manager)
- Konto Google Cloud z dostępem do Google Indexing API

## Instalacja

1. Sklonuj repozytorium:

    ```bash
    git clone https://github.com/kemuriCode/bulk-google-index-api.git
    cd bulk-google-index-api
    ```

2. Zainstaluj wymagane pakiety:

    ```bash
    npm install
    ```

3. Skonfiguruj zmienne środowiskowe:

    Stwórz plik `.env` w katalogu głównym projektu i dodaj swoje klucze API:

    ```plaintext
    GOOGLE_API_KEY=your-google-api-key-here
    GOOGLE_CLIENT_ID=your-google-client-id-here
    GOOGLE_CLIENT_SECRET=your-google-client-secret-here
    GOOGLE_REDIRECT_URL=your-google-redirect-url-here
    ```

4. Uruchom aplikację lokalnie:

    ```bash
    node app.js
    ```

    Aplikacja będzie dostępna pod adresem: `http://localhost:1337`.

## Wdrożenie na Vercel

1. **Połącz z GitHub:** Utwórz repozytorium na GitHub i wypchnij tam kod.

2. **Skonfiguruj projekt na Vercel:**
   - Połącz repozytorium GitHub z Vercel.
   - Skonfiguruj zmienne środowiskowe na Vercel (takie same jak w `.env`).

3. **Wdrożenie:** Vercel automatycznie wdroży Twoją aplikację. Możesz monitorować status wdrożenia z panelu Vercel.

## Użycie

1. **Wprowadź URL-e:** Wprowadź listę URL-ów do zaindeksowania w formularzu aplikacji.

2. **Prześlij URL-e:** Kliknij przycisk "Klik", aby przesłać URL-e do Google Indexing API.

3. **Wyniki:** Wyniki indeksowania zostaną wyświetlone na ekranie lub w konsoli.


## Licencja

Ten projekt jest objęty licencją MIT - zobacz plik [LICENSE](LICENSE) po więcej szczegółów.# bulk-google-index-api
