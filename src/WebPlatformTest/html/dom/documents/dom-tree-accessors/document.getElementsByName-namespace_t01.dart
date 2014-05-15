/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.getElementsByName/document.getElementsByName-namespace.xhtml
 * @assertion http://www.whatwg.org/html5/#dom-document-getelementsbyname
 * @description getElementsByName and foreign namespaces
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<p name="math"><math name="math" xmlns="http://www.w3.org/1998/Math/MathML">
<mi>a</mi>
<mo>+</mo>
<mi>b</mi>
</math></p>
<p name="svg"><svg width="300" height="100" name="svg" xmlns="http://www.w3.org/2000/svg">
<rect width="300" height="100" fill="rgb(0,0,255)"/>
</svg></p>
</div>
''';
         
void main() {
//  var ps = document.getElementById("test").getElementsByTagName("p");
  var ps = document.querySelector("#test").querySelector("p");
  assert_equals(document.getElementsByName("math").length, 1);
  assert_equals(document.getElementsByName("math")[0], ps[0]);
  assert_equals(document.getElementsByName("svg").length, 1);
  assert_equals(document.getElementsByName("svg")[0], ps[1]);
}
