/**
 * after web-platform-tests/html/semantics/forms/the-textarea-element/textarea-type.html
 * @assertion
 * href="http://www.whatwg.org/html5/#dom-textarea-type
 * @description The type IDL attribute
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<textarea></textarea>  
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  assert_equals(document.getElementById("test")
                        .queryAll("textarea")[0].type,
                "textarea",
                "Textarea's type attribute should return 'textarea'");
}
