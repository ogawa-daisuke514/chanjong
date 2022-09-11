/* global gon */

let tile_selector = null;
let input_id = null;

function showSelector(id) {
  let elem = document.getElementById(id);
  if(elem == null){
    alert("elem is null");
    return;
  }
  if(tile_selector == null){
    alert("selector is null");
    return;
  }
  input_id = id;
  elem.appendChild(tile_selector);
}
function hideSelector(){
  input_id = null;
  tile_selector = document.getElementById("tile_selector");
  tile_selector.remove();
}

function setListner(id){
  let button = document.getElementById(id);
  button.addEventListener("click", () => showSelector(id))
}

function setValue(event, item, value){
  if(input_id == null){
    alert("input_id is null");
    return true;
  }
  let id = input_id
  let elem = document.getElementById(id);
  let img = item.children.item(0).cloneNode(true)
  hideSelector()
  elem.innerHTML = "";
  elem.appendChild(img)
  let input = document.createElement("input")
  input.setAttribute("type", "hidden")
  input.setAttribute("name", id)
  input.setAttribute("value", value)
  elem.appendChild(input)
  // alert("id=" + id + ", value=" + value)
  // table_col.stopPropagation();
  event.stopPropagation();
}

let cells = document.getElementsByClassName("tile_selector_cell");
for(let i = 0; i<cells.length; i++){
  cells.item(i).addEventListener("click", (event)=> setValue(event, cells.item(i), i))
}

hideSelector();
setListner("button")
setListner("button2")