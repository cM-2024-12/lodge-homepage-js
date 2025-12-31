export function loadMenu() {
    const content = document.querySelector('#content');
    
    // Create a container div for styling
    const menuDiv = document.createElement('div');
    menuDiv.classList.add('menu');
    
    // Create menu content
    const heading = document.createElement('h1');
    heading.textContent = 'Our Menu';
    
    // You could create menu items like this:
    const item1 = document.createElement('div');
    item1.classList.add('menu-item');
    item1.innerHTML = '<h3>Dam Special</h3><p>Fresh logs daily - $12</p>';
    
    const item2 = document.createElement('div');
    item2.classList.add('menu-item');
    item2.innerHTML = '<h3>Bark Platter</h3><p>Assorted bark varieties - $8</p>';
    
    // Append everything
    menuDiv.append(heading, item1, item2);
  content.appendChild(menuDiv);
}