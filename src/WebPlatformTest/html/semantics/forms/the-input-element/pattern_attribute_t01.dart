/**
 * after web-platform-tests/html/semantics/forms/the-input-element/pattern_attribute.html
 * @assertion
 * http://www.w3.org/TR/html5/common-input-element-attributes.html#attr-input-pattern
 * @description Pattern Attribute
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <h1>Pattern Attribute</h1>
        <div style="display: none">
        <input pattern="[a-z]{3}" value="abcd" title="three letters max"/>
        </div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  InputElement input0=document.getElementsByTagName("input")[0];
  var pattern=input0.getAttribute("pattern");
  assert_equals(pattern, "[a-z]{3}", "pattern attribute support on input element");
}