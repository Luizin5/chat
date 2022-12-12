const ul =  document.getElementById("msgs")
const ws = new WebSocket("ws://0.0.0.0:1200")



ws.onmessage = (msg) => {
  add(msg.data)
}
ws.onopen = function(e){ alert("blz")}


add = (txt) =>{ 
     
  txt = txt.split("/color")
  li = document.createElement("li")
  li.appendChild(document.createTextNode(txt[0]))

  color = ""
  if(txt.lenght != 1) {
    color = txt[txt.length-1].trim()
  }
  li.style.color = color

  ul.appendChild(li)
}
  
function enviar(){
   
  text = document.getElementById("text")
  name = name
  ws.send(name+" : "+text.value)
  text.value = ""
  //alert(text.value)
}

