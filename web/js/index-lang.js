// Get the location url, take the lang, and highlight the current link
let page_url = window.location.href;
let re = /.*homebox.space\/index-([a-z][a-z])\.html/;
let link_id = page_url.replace(re, 'menu-link-$1');

let link = document.getElementById(link_id);

if ( link ) {
    link.classList.add("active");
}
