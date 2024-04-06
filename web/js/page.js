
// Get the current page title if exist
const page_titles = document.getElementsByTagName("H1");

const currentPath = document.getElementById("path-current");

if ( currentPath ) {
    currentPath.innerHTML = page_titles[0].innerHTML;
}
