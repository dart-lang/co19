/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.getElementsByName/document.getElementsByName-param.html
 * @assertion http://www.whatwg.org/html5/#dom-document-getelementsbyname
 * @description getElementsByName and the param element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<param name="test1">
<object>
<param name="test2">
</object>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);
  assert_equals(document.getElementsByName("test1").length, 1);
  assert_equals(document.getElementsByName("test1")[0],
                document.getElementsByTagName("param")[0]);
  assert_equals(document.getElementsByName("test2").length, 1);
  assert_equals(document.getElementsByName("test2")[0],
                document.getElementsByTagName("param")[1]);
}
