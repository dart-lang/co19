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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:checked)
 * @needsreview  Dart issue #19787
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<select id=select1>
 <optgroup label="options" id=optgroup1>
  <option value="option1" id=option1 selected>option1
  <option value="option2" id=option2>option2
  <option value="option2" id=option3 checked>option3
</select>
<input type=checkbox id=checkbox1 checked>
<input type=checkbox id=checkbox2>
<input type=checkbox id=checkbox3 selected>
<input type=radio id=radio1 checked>
<input type=radio id=radio2>
<form>
  <p><input type=submit contextmenu=formmenu id="submitbutton"></p>
  <menu type=popup id=formmenu>
    <menuitem type=checkbox checked default id=menuitem1>
    <menuitem type=checkbox default id=menuitem2>
    <menuitem type=checkbox id=menuitem3>
    <menuitem type=radio checked id=menuitem4>
    <menuitem type=radio id=menuitem5>
  </menu>
</form>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  testSelector(":checked"
    , ["option1", "checkbox1", "radio1", "menuitem1", "menuitem4"]
    , "':checked' matches checked <input>/<menuitem> in checkbox and radio button states, selected <option>s");
  
  document.getElementById("checkbox1").attributes.remove("type");  // change type of input
  document.getElementById("radio1").attributes.remove("type");  // change type of input
  testSelector(":checked"
    , ["option1", "menuitem1", "menuitem4"]
    , "':checked' should no longer match <input>s whose type checkbox/radio has been removed");

  OptionElement option2=document.getElementById("option2");
  option2.selected = true;  // select option2
  document.getElementById("checkbox2").click();  // check chekbox2
  document.getElementById("radio2").click();  // check radio2
  testSelector(":checked"
    , ["option2", "checkbox2", "radio2", "menuitem1", "menuitem4"]
    , "':checked' matches clicked checkbox and radio buttons");

  checkTestFailures();
}

