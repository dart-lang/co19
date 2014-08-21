/**
 * after web-platform-tests/html/semantics/forms/the-input-element/hidden.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/forms.html#hidden-state-(type=hidden)
 * @description Hidden input element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Hidden input element</h1>
    <div style="display: none">

    <input id="hidden" type="hidden" />
    <input id="hidden_with_value" type="hidden" value="foo" />

    </div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  InputElement hidden=document.getElementById("hidden");
  InputElement hidden_with_value=document.getElementById("hidden_with_value");

  test(() {
    assert_equals(hidden.value, "");
    assert_equals(hidden_with_value.value, "foo");
  }, "Value returns the current value for hidden");

  test(() {
    hidden.value = "A";
    assert_equals(hidden.value, "A");
    hidden.value = "B";
    assert_equals(hidden.value, "B");
  }, "Setting value changes the current value for hidden");

  test(() {
    assert_equals(hidden.files, null);
  }, "files attribute must return null for hidden");

  test(() {
    assert_equals(hidden.valueAsDate, null);
  }, "valueAsDate attribute must return null for hidden");

  test(() {
    assert_equals(hidden.valueAsNumber.toString(), "NaN");
  }, "valueAsNumber attribute must return NaN for hidden");

  test(() {
    assert_equals(hidden.list, null);
  }, "list attribute must return null for hidden");

  test(() {
    var el = hidden;
    assert_throws("InvalidStateError", () { el.stepDown(); }, "");
  }, "stepDown does not apply for hidden");

  test(() {
    var el = hidden;
    assert_throws("InvalidStateError", () { el.stepUp(); }, "");
  }, "stepUp does not apply for hidden");

  checkTestFailures();
}
