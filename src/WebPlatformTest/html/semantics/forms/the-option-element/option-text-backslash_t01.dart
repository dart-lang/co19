/**
 * after web-platform-tests/html/semantics/forms/the-option-element/option-text-backslash.html
 * @assertion
 * @description Test for the backslash sign in option.text
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String value='value';
const String expected='expected';
const String testname='testname';

const String htmlEL=r'''
<select id=test><option>\</option></select>
''';

void main() {
  document.body.appendHtml(htmlEL);
  var select = document.getElementById("test");
  var option = select.firstChild;
  assert_equals(option.text, "\\", "${option.text.length}");
}
