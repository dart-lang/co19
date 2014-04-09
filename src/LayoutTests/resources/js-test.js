
// Sometimes we need to call js funcs from dart tests 
// for ex. to test script element

function startJSTest() {
  var x = document.createElement('div');
  x.id = 'asyncJS';
  x.innerHTML = 'FAIL';
  document.body.appendChild(x);
}

function finishJSTest() {
  var x = document.getElementById('asyncJS');
  if (x) {
    x.innerHTML = 'PASS';
  }
}

function debug(msg) {
  var x = document.getElementById('console');
  if (x) {
    var span = document.createElement("span");
    span.innerHTML = msg + '<br />';
    x.appendChild(span);
  }
}
