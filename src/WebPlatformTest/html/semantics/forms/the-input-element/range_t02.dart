/**
 * after web-platform-tests/html/semantics/forms/the-input-element/range-2.html
 * @assertion
 * @description range input Tests
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<input type="range" id="r00" min="0" max="100" step="20" value="40" style="display:none">
<input type="range" id="r01" min="0" max="1" step=".1" value=".2" style="display:none">
<input type="range" id="r02" style="display:none">
<input type="range" id="r03" style="display:none">
<input type="range" id="r04" style="display:none">
''';

void main() {
  document.body.appendHtml(htmlEL);

test(() {
  document.getElementById('r00').value = "";
  assert_equals(document.getElementById('r00').type, "range");
  assert_equals(document.getElementById('r00').value, "60");
}, "range input value set to ''");

test(() {
  document.getElementById('r01').value = ".6";
  assert_equals(document.getElementById('r01').type, "range");
  assert_equals(document.getElementById('r01').value, "0.6");
}, "range input value set to an integer");

test(() {
  assert_equals(document.getElementById('r02').type, "range");
  assert_equals(document.getElementById('r02').value, "50");
}, "range input value equals 50");

test(() {
  document.getElementById('r03').value = "200";
  assert_equals(document.getElementById('r03').type, "range");
  assert_equals(document.getElementById('r03').value, "100");
}, "range input value equals 100");

test(() {
  document.getElementById('r04').value = "2.1";
  assert_equals(document.getElementById('r04').type, "range");
  assert_equals(document.getElementById('r04').value, "2");
}, "range input value equals 2");

  checkTestFailures();
}
