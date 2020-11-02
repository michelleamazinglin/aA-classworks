const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  let dogsArr = [];
  
  for(let idx in dogs){
    const li = document.createElement("li");
    li.classList.add("dog-link");
    li.classList.add("hide");
    const a = document.createElement("a");
    a.href = dogs[idx];
    const aContent = document.createTextNode(idx); //dog name inside a tag
    a.appendChild(aContent);
    li.appendChild(a);
    dogsArr.push(li);
  }
  return dogsArr;
}

function attachDogLinks(){
  let dogLinks = dogLinkCreator();
  const ul = document.querySelector(".drop-down-dog-list")
  for(let el of dogLinks){
    ul.appendChild(el);
  }
}

function handleEnter () {
  const parent = document.querySelector(".drop-down-dog-nav");
  //grab first element
  const lis = document.querySelectorAll(".dog-link");
  //only got the first one
  parent.addEventListener("mouseover", function (e) {
    for (let el of lis){
      el.classList.remove("hide")
      el.classList.add("show")
    }
  });
}

function handleLeave () {
  const parent = document.querySelector(".drop-down-dog-nav")
  const lis = document.querySelectorAll(".dog-link");
  parent.addEventListener("mouseleave", function (e) {
    for (let el of lis) {
      el.classList.remove("show")
      el.classList.add("hide")
    }
  });
}

attachDogLinks();
handleEnter();
handleLeave();