import "./styles.css"
import loadHome from "./home.js"
import { loadMenu } from "./menu.js"
import { loadAbout } from "./about.js"

console.log("index.js loaded")
loadHome()

// get buttons
const homeBtn = document.querySelector("#home-btn")
const aboutBtn = document.querySelector("#about-btn")
const menuBtn = document.querySelector("#menu-btn")

// event listeners 
homeBtn.addEventListener("click", () => {
    clearContent();
    loadHome();
})

aboutBtn.addEventListener("click", () => {
    clearContent();
    loadAbout();
})

menuBtn.addEventListener("click", () => {
    clearContent();
    loadMenu();
})

function clearContent() {
  const content = document.querySelector('#content');
  content.textContent = ''; // Wipes everything
}