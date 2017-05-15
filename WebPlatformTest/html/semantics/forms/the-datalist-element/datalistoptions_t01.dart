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
 * after web-platform-tests/html/semantics/forms/the-datalist-element/datalistoptions.html
 * @assertion
 *  <link rel=help href="http://www.whatwg.org/html/#the-datalist-element">
 * @description Datalist element options
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<label>
  Number:
  <input list=numbers>
</label>
<datalist id=numbers>
  <label> Select number:
    <select id=num>
      <option label="zero" value="0">
      <option label="one" value="1">
      <option label="two">2
      <option label="three" disabled>3
      <option>
    </select>
  </label>
</datalist>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  test((){
    var datalist = document.getElementById('numbers'),
        labels = [],
        values = [];
    assert_equals(datalist.options.length, 3, "The datalist has 3 options. Disabled and empty value options aren't taken into account");

    for (var i = 0, len = datalist.options.length; i < len; i++) {
      labels.add(datalist.options[i].label);
      values.add(datalist.options[i].value);
    }
    assert_array_equals(labels, ["zero", "one", "two"]);
    assert_array_equals(values, ["0", "1", "2"]);
  }, "options label/value");

  test((){
    assert_false(document.getElementById('num').willValidate);
  }, "If an element has a datalist element ancestor, it is barred from constraint validation");

  checkTestFailures();
}
