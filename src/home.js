import coryImage from "./image copy.jpg"
function loadHome () {
    const content = document.querySelector("#content")
    // create elements
    const h1 = document.createElement("h1")
    h1.textContent = 'LODGE'

    const h3 = document.createElement("h3")
    h3.textContent = "Building your dam, one log at a time."

    const img = document.createElement('img')
    img.classList.add("img");
    img.src= coryImage
    img.onload = () => console.log('Image loaded!', img);
    img.onerror = () => console.log('Image failed to load');

    content.append(h1, h3, img)
}

export default loadHome;
