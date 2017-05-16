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
 * after web-platform-tests/html/semantics/forms/the-form-element/form-elements-nameditem-02.html
 * @assertion
 * <link rel="help" href="http://www.whatwg.org/html5/#dom-form-elements">
 * <link rel="help" href="http://www.whatwg.org/html5/#parsing-main-intr">
 * @description form.elements: parsing
 * form.elements should work correctly in the face of table syntax errors.
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<form id=form>
<table>
<tr>
<td><input type="radio" name="radio1" id="r1" value=1></td>
<td><input type="radio" name="radio2" id="r2" value=2></td>
<input type="radio"  name="radio0" id="r0" value=0>
</tr>
</table>
</form>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var form = document.getElementById("form");
  assert_array_equals(form.children,
                      [document.getElementById("r0"),
                       document.getElementById("r1"),
                       document.getElementById("r2")]);
}
