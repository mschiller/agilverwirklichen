import cookieconsent from "cookieconsent"

function loadGAonConsent() {
  window.ga = window.ga || function () {
    (ga.q = ga.q || []).push(arguments)
  };
  ga.l = +new Date;
  ga('create', 'UA-162766648-1', 'auto');
  ga('set', 'anonymizeIp', true);
  ga('send', 'pageview');
  var gascript = document.createElement("script");
  gascript.async = true;
  gascript.src = "https://www.google-analytics.com/analytics.js";
  document.getElementsByTagName("head")[0].appendChild(gascript, document.getElementsByTagName("head")[0]);
}

if (document.cookie.split(';').filter(function (item) {
    return item.indexOf('cookieconsent_status=allow') >= 0
  }).length) {
  if (location.hostname !== "localhost" && location.hostname !== "127.0.0.1") {
    //if (navigator.doNotTrack != 1 && navigator.doNotTrack != "yes" && window.doNotTrack != 1 && navigator.msDoNotTrack != 1) {
    loadGAonConsent();
    //}
  }
}

window.addEventListener("load", function () {
  window.cookieconsent.initialise({
    "palette": {
      "popup": {
        "background": "#edeff5",
        "text": "#838391"
      },
      "button": {
        "background": "#4b81e8"
      }
    },
    "position": "bottom-left",
    "type": "opt-in",
    "content": {
      "message": "Diese Webseite verwendet Cookies um Ihnen die bestmögliche User Experience zu bieten.",
      "dismiss": "Alles klar!",
      "deny": "Alle Cookies ablehnen",
      "link": "Mehr erfahren",
      "href": "https://www.agil-verwirklichen.de/privacy"
    },
    onStatusChange: function (status, chosenBefore) {
      var type = this.options.type;
      var didConsent = this.hasConsented();
      if (type == 'opt-in' && didConsent) {
        // enable cookies
        if (location.hostname !== "localhost" && location.hostname !== "127.0.0.1") {
          //if (navigator.doNotTrack != 1 && navigator.doNotTrack != "yes" && window.doNotTrack != 1 && navigator.msDoNotTrack != 1) {
          loadGAonConsent();
          //}
        }
      }
    }
  })
});