/**
 * after web-platform-tests/html/dom/elements/global-attributes/id-name.html
 * @assertion http://www.whatwg.org/html5/#the-id-attribute
 * @description id and name attributes and getElementById
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<div name="abcd"></div>
<p name="abcd" id="abcd"></p>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);
  assert_equals(document.getElementById("abcd").nodeName, "P");
  assert_equals(document.getElementById("abcd").localName, "p");
}
