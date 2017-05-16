/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
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
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

test(() {
  assert_equals(document.getElementById("form").children.length, 0);
}, "input type=image should not be present in the form.elements collection");

test(() {
  var form = document.getElementById("form");
  var i = document.createElement("input") as InputElement;
  i.name = "a2";
  form.append(i);
  var j = document.createElement("input") as InputElement;
  j.name = "a03";
  form.append(j);
  assert_array_equals(form.children, [i, j]);
  Expect.identical(form.children[0], i, '[0]');
  Expect.identical(form.children[1], j, '[1]');
}, "form.elements should include elements whose name starts with a number");

  checkTestFailures();
}
