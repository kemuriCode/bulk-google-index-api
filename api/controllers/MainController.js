var S = require('string');
const {google} = require('googleapis');

/**
 * MainController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

const oauth2Client = new google.auth.OAuth2(
  sails.config.globals.google_client_id,
  sails.config.globals.google_client_secret,
  sails.config.globals.google_redirect_url,
);

function checkUrlList(urls) {

  urls = urls.split('\r\n');

  var result = [];
  urls.forEach((url, i) => {
    var string = S(url).collapseWhitespace().s;
    string = string.trim();
    string = S(string).escapeHTML().s;
    string = string.toLowerCase();
    if (string !== "") {
      result.push(string);
    }
  });
  return result;

}

module.exports = {

  homepage: async function(req, res) {

    if (req.method == "POST") {

      let urls = checkUrlList(req.body.urls);
      res.view({
        urls: urls
      })

    } else {
      res.view();
    }

  },

  login: async function(req, res) {

    const authorizationUrl = oauth2Client.generateAuthUrl({ access_type: 'offline', scope: sails.config.globals.google_scopes });
    res.redirect(authorizationUrl);

  },

  token: async function(req, res) {

    var code = req.param('code');
    const {tokens} = await oauth2Client.getToken(code);
    req.session.tokens = tokens;

    res.redirect('/');

  },

  publish: async function(req, res) {

    oauth2Client.setCredentials(req.session.tokens);

    var indexnow = google.indexing({
      version: 'v3',
      auth: oauth2Client,
    });

    var url = req.body.url.trim();

    try {

      var response = await indexnow.urlNotifications.publish({
        requestBody: {
          url: url,
          type: 'URL_UPDATED',
        }
      })
      res.ok(response);

    } catch (e) {

      res.badRequest({
        error: true,
        response: e,
      })

    }

  },


};
