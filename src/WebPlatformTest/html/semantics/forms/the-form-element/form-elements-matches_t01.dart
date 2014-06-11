/**
 * after web-platform-tests/html/semantics/forms/the-form-element/form-children-matches.html
 * @assertion
 * <link rel="help" href="http://www.whatwg.org/html5/#dom-form-children">
 * @description form.children: matches
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
  <form id="form">
    <input type="image">
  </form>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);

test(() {
  assert_equals(document.getElementById("form").children.length, 0);
}, "input type=image should not be present in the form.elements collection");

test(() {
  var form = document.getElementById("form");
  var i = document.createElement("input");
  i.name = "a2";
  form.append(i);
  var j = document.createElement("input");
  j.name = "a03";
  form.append(j);
  assert_array_equals(form.children, [i, j]);
  Expect.identical(form.children[0], i, '[0]');
  Expect.identical(form.children[1], j, '[1]');
}, "form.elements should include elements whose name starts with a number");

  checkTestFailures();
}
