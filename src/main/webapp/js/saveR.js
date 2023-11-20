function saveR(r){
  document.getElementById('r').value = r.value;
  r.disabled= true;
  let butttons = document.getElementsByClassName("inputR");
  for(let i = 0; i<butttons.length; ++i){
    if(butttons[i] !== r){
      butttons[i].disabled=false;
    }
  }
  drawGraph(r.value);
  drawDots(r.value);
}