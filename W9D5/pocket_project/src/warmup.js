
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    // if the incoming htmlElement has any children
    // debugger
    if (htmlElement.children) { 
        let arr = Array.from(htmlElement.children)
        for(let el of arr){
            htmlElement.removeChild(el) 
        }   
    }
//The desired behavior of this function is the input string will be converted into a <p> tag and then appended to the input HTML Element.
   
    const newP = document.createElement("p");
    const newContent = document.createTextNode(string);
    newP.appendChild(newContent);
    htmlElement.appendChild(newP); 
};

htmlGenerator("Michelle && Nikolay's verison <3", partyHeader);