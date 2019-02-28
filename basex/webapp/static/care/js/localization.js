// use plugins and options as needed, for options, detail see
// http://i18next.com/docs/
i18next.init({
lng: 'en', // evtl. use language-detector https://github.com/i18next/i18next-browser-languageDetector
resources: { // evtl. load via xhr https://github.com/i18next/i18next-xhr-backend
  en: {
	translation: {
	  input: {
		placeholder: "a placeholder"
	  },
	  nav: {
		home: 'Home',
		page1: 'Page One',
		page2: 'Page Two'
	  }
	}
  }
}
}, function(err, t) {
// for options see
// https://github.com/i18next/jquery-i18next#initialize-the-plugin
jqueryI18next.init(i18next, $);

// start localizing, details:
// https://github.com/i18next/jquery-i18next#usage-of-selector-function
$('.nav').localize();
$('.content').localize();
});