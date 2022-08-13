/* global gon */

let ptype_info = {}

function get_proc_types(unit, type){
  let any_unit = ["piece", "tile"].includes(unit)
  let any_type = ["tile", "color", "num"].includes(type)
  return gon.ProcessTypes.filter(
    (t) => {
      return t.parent == null &&
        ((any_unit && t.out_unit === "any") || t.out_unit === unit) &&
        ((any_type && t.out_type === "any") || t.out_type === type)
    }
  )
}

function get_exclusive_types(proc_id){
  return gon.ProcessTypes.filter(
    (t) => {
      return t.parent === proc_id
    }
  )
}

function get_children_types(proc_id, unit, type){
  let exc = get_exclusive_types(proc_id)
  return (exc.length > 0 ? exc : get_proc_types(unit, type));
}

function option_tag_from(value, name){
  let opt = document.createElement('option')
  opt.setAttribute('value', value)
  opt.textContent = name
  return opt
}

function createElementWithId(ename, id){
  let elem = document.createElement(ename)
  elem.setAttribute('id', id)
  return elem
}

function new_child(id, ptypes, out_unit, out_type){
  let div = createElementWithId('div', id)
  div.setAttribute('style', "border: 1px solid; padding: 4px;")

  let general = ptypes.length > 0 && !ptypes[0].parent
  let sel = createElementWithId((general ? "select" : "input"), id + "[process_type_id]")
  sel.setAttribute('name', id + "[process_type_id]")
  if(general){
    sel.addEventListener('change', (e) => handleSelected(id, e))
    ptypes.map((p) => sel.appendChild(option_tag_from(p.id, p.name)))
  }else{
    sel.setAttribute("type", "hidden")
    sel.setAttribute("value", ptypes[0].id)
  }
  div.appendChild(sel)

  let span_head = createElementWithId('span', id + "head")
  div.appendChild(span_head)

  let conditions = createElementWithId('div', id + "[conditions]")
  div.appendChild(conditions)

  let add_new = createElementWithId('div', id + "add_new")
  div.appendChild(add_new)

  let span_tail = createElementWithId('span', id + "tail")
  div.appendChild(span_tail)

  return div
}

function new_button(id){
  let button = document.createElement("button")
  button.textContent = "Add New .."
  button.setAttribute("type", "button")
  button.addEventListener('click', (e) => add_child(id))
  return button
}



function dfi(id){
  return document.getElementById(id)
}

function add_default_to(id, new_id){
  let unit = "piece"
  let type = "tile"
  let ptypes = get_children_types(0, unit, type)
  let e = dfi(id)
  if(e && e.children.length === 0){
    e.appendChild(new_child(new_id, ptypes, unit, type))
    ptype_info[new_id] = { out_unit: unit, out_type: type }
    set_ptype(new_id, ptypes[0])
  }
}

function set_ptype(element_id, ptype){
  updateInfo(element_id, ptype)
  updateContent(element_id, ptype)
}

function updateInfo(element_id, ptype){
  let info = ptype_info[element_id]
  let unit = info.out_unit
  let type = info.out_type
  info.in_unit = (ptype.in_unit === "out" ? unit : ptype.in_unit)
  info.in_type = (ptype.in_type === "out" ? type : ptype.in_type)
  info.valid_child_types = get_children_types(ptype.id, info.in_unit, info.in_type)
  info.newest_child_n = 0
}

function updateContent(element_id, ptype){
  add_word_and_selector(dfi(element_id + "head"), element_id, ptype, ptype.head_word)
  add_word_and_selector(dfi(element_id + "tail"), element_id, ptype, ptype.tail_word)
  let children = dfi(element_id + "[conditions]")
  let add_new =  dfi(element_id + "add_new")
  add_new.innerHTML = ""
  if(ptype.children_count < 0){
    add_new.appendChild(new_button(element_id))
  }
  children.innerHTML = ""
  let count = ptype.children_count
  if(count < 0){
    add_child(element_id)
  }else{
    for(let i = 0; i < count; i++){
      add_child(element_id)
    }
  }
}

function add_word_and_selector(toElem, id, ptype, word){
  if(word && ptype.arg_type){
    let spl = word.split("_ARG")
    if(spl.length > 1){
      toElem.innerHTML = ""
      toElem.append(spl[0])
      toElem.appendChild(arg_selector(id, ptype))
      toElem.append(spl[1])
      return
    }
  }
  toElem.textContent = word ?? ""
}

function arg_selector(id, ptype){
  let sel = createElementWithId("select", id + "[arg]")
  sel.setAttribute("name", id + "[arg]")
  let args = gon.Args[ptype.arg_type]
  for(let i = 0; i < args.length; i++){
    sel.appendChild(option_tag_from(i, args[i]))
  }
  return sel
}

function add_child(id){
  let ptype = gon.ProcessTypes[+dfi(id + "[process_type_id]").value]
  let info = ptype_info[id]
  let count = info.newest_child_n
  info.newest_child_n += 1
  let new_id = id + "[conditions][" + count + "]"
  let wrapper = createElementWithId("div", new_id + "wrapper")

  if(ptype.children_count < 0){
    // 可変数の子を持つ場合のみ、消去ボタンを生成
    let button = document.createElement("button")
    button.setAttribute("type", "button")
    button.addEventListener('click', (e) => remove_child(new_id))
    button.textContent = "x"
    wrapper.appendChild(button)
  }
  dfi(id + "[conditions]").appendChild(wrapper)
  put_new_cond(wrapper, new_id, info.valid_child_types, info.in_unit, info.in_type)
  if(ptype.middle_word) wrapper.append(ptype.middle_word)
}

function remove_child(id){
  dfi(id + "wrapper").remove()
}

function put_new_cond(toElem, id, ptypes, out_unit, out_type){
  ptype_info[id] = { out_unit: out_unit, out_type: out_type }
  let child = new_child(id, ptypes, out_unit, out_type)
  toElem.appendChild(child)
  set_ptype(id, ptypes[0])
}

function handleSelected(id, e){
  set_ptype(id, gon.ProcessTypes[+e.target.value])
}

add_default_to("condition_root", "condition")
