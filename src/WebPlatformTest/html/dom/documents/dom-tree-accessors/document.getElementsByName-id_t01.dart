/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.getElementsByName/document.getElementsByName-id.html
 * @assertion http://www.whatwg.org/html5/#dom-document-getelementsbyname
 * @description getElementsByName and ids
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<div id="abcd"></div>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);
  assert_equals(document.getElementsByName("abcd").length, 0);
}
