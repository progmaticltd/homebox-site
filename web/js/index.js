// Detect the browser language
let lang = navigator.language.substr(0,2);

let address = window.location.href;

// List of known languages
let languages = [ "en", "fr" ];

if ( ! languages.includes(lang) ) {
    console.log("Language not supported: " + lang);
} else if ( location.pathname != "/" ) {
    let newAddress = address.replace(/index.html/, ("index-" + lang + ".html"));
    window.setTimeout(() => { window.location.replace(newAddress) }, 3000);
} else {
    window.setTimeout(() => { window.location.replace(address + "index-en.html") }, 3000);
}
