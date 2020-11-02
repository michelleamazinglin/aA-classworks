function addTodo() {
    const form = document.querySelector('form');
    const ul = document.querySelector('.todos');

    form.addEventListener("submit", function (e) {
        e.preventDefault();
       
        let li = document.createElement("li");
     
        const value = document.querySelector("input[name='add-todo']").value;
        
        let todo = document.createTextNode(value);
        let checkbox = document.createElement("INPUT");
        checkbox.setAttribute("type", "checkbox");

        li.appendChild(checkbox);
        li.appendChild(todo);
        ul.appendChild(li);

        form.reset();
    });
}
addTodo();
