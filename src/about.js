export function loadAbout() {
    const content = document.querySelector('#content');
    
    const aboutDiv = document.createElement('div');
    aboutDiv.classList.add('about');
    
    const heading = document.createElement('h1');
    heading.textContent = 'About Lodge';
    
    const description = document.createElement('p');
    description.textContent = 'We\'ve been building dams since 1823...';
    
    aboutDiv.append(heading, description);
    content.appendChild(aboutDiv);
  }