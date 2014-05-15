/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.getElementsByName/document.getElementsByName-case.html
 * @assertion http://www.whatwg.org/html5/#dom-document-getelementsbyname
 * @description getElementsByName and case
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<div name="abcd"></div>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);
  assert_equals(document.getElementsByName("ABCD").length, 0);
  assert_equals(document.getElementsByName("abcd").length, 1);
}
