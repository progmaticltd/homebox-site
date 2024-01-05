// Detect the browser language
let lang = navigator.language.substr(0,2);

switch(lang) {

case "fr":
    window.location.replace("https://homebox.space/index-fr.html");
    break;

case "en":
    window.location.replace("https://homebox.space/index-en.html");
    break;

default:
    window.location.replace("https://homebox.space/index-en.html");
    break;

}
