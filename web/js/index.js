// Detect the browser language
let lang = navigator.language.substr(0,2);

let address = window.location.href;

// List of known languages
let languages = [ "en", "fr" ];

const timer = 250;

if ( ! languages.includes(lang) ) {
    console.log("Language not supported: " + lang);
} else if ( location.pathname != "/" ) {
    let newAddress = address.replace(/index.html/, ("index-" + lang + ".html"));
    window.setTimeout(() => { window.location.replace(newAddress) }, timer);
} else {
    window.setTimeout(() => { window.location.replace(address + "index-en.html") }, timer);
}
