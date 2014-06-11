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

  test(() {
    assert_equals(document.getElementById("hidden").value, "");
    assert_equals(document.getElementById("hidden_with_value").value, "foo");
  }, "Value returns the current value for hidden");

  test(() {
    document.getElementById("hidden").value = "A";
    assert_equals(document.getElementById("hidden").value, "A");
    document.getElementById("hidden").value = "B";
    assert_equals(document.getElementById("hidden").value, "B");
  }, "Setting value changes the current value for hidden");

  test(() {
    assert_equals(document.getElementById("hidden").files, null);
  }, "files attribute must return null for hidden");

  test(() {
    assert_equals(document.getElementById("hidden").valueAsDate, null);
  }, "valueAsDate attribute must return null for hidden");

  test(() {
    assert_equals(document.getElementById("hidden").valueAsNumber.toString(), "NaN");
  }, "valueAsNumber attribute must return NaN for hidden");

  test(() {
    assert_equals(document.getElementById("hidden").list, null);
  }, "list attribute must return null for hidden");

  test(() {
    var el = document.getElementById("hidden");
    assert_throws("InvalidStateError", () { el.stepDown(); }, "");
  }, "stepDown does not apply for hidden");

  test(() {
    var el = document.getElementById("hidden");
    assert_throws("InvalidStateError", () { el.stepUp(); }, "");
  }, "stepUp does not apply for hidden");

  checkTestFailures();
}
