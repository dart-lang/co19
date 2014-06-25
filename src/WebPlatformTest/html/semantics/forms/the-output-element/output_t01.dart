/**
 * after web-platform-tests/html/semantics/forms/the-output-element/output.html
 * @assertion
 * href="http://www.w3.org/html/wg/drafts/html/master/#the-output-element
 * @description The output element: output value and defaultValue
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<output id=output></output>
''';

void main() {
    document.body.appendHtml(htmlEL);

    var output = document.getElementById("output");
    assert_equals(output.type, "output", "type must return the string 'output'");
    assert_equals(output.text, "", "text is empty");
    assert_equals(output.value, "", "value should be empty");
    assert_equals(output.defaultValue, "", "defaultValue should be empty");

    output.text="5";
    assert_equals(output.value, "5", "text is set to 5: value is updated");
    assert_equals(output.text, "5", "text is set to 5");
    assert_equals(output.defaultValue, "5", "text is set to 5: defaultValue is updated");

    output.defaultValue="10"; // value mode flag is in "default" mode. Setting defaultValue should set text as well
    assert_equals(output.value, "10", "defaultValue is set to 10: value is updated");
    assert_equals(output.text, "10", "defaultValue is set to 10: text is updated");
    assert_equals(output.defaultValue, "10", "defaultValue is set to 10");

    output.value="20";  // set the value mode flag to "value": default value remains unchanged
    assert_equals(output.value, "20", "value is set to 20");
    assert_equals(output.text, "20", "value is set to 20: text is updated");
    assert_equals(output.defaultValue, "10", "value is set to 20: defaultValue remains unchanged");

    output.defaultValue="15"; // value mode flag is in "value" mode. text remains unchanged when setting defaultValue
    assert_equals(output.value, "20", "defaultValue is set to 15: value remains unchanged");
    assert_equals(output.text, "20", "defaultValue is set to 15: text remains unchanged");
    assert_equals(output.defaultValue, "15", "defaultValue is set to 15");
}
