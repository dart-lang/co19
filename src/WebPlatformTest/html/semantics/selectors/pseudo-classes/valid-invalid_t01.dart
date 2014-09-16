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
 * after web-platform-tests/html/semantics/selectors/pseudo-classes/valid-invalid.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#pseudo-classes
 * @description Selector: pseudo-classes (:valid, :invalid)
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";
import "utils.dart";

const String htmlEL = r'''
<input type=text id=text1 value="foobar" required>
<input type=text id=text2 required>
<form id=form1>
  <input type=text id=text3 value="foobar" required>
</form>
<form id=form2>
  <input type=text id=text4 required>
</form>
<fieldset id=fieldset1>
  <input type=text id=text5 value="foobar" required>
</fieldset>
<fieldset id=fieldset2>
  <input type=text id=text6 required>
</fieldset>
<input type=text id=text7 value="AAA" pattern="[0-9][A-Z]{3}">
<input type=text id=text8 value="0AAA" pattern="[0-9][A-Z]{3}">
<input type=number id=number1 value=0 min=1>
<input type=number id=number2 value=1 min=1>
''';

void main() {
  document.body.appendHtml(htmlEL);

  testSelector(":valid"
    , ["text1", "form1", "text3", "fieldset1", "text5", "text8", "number2"]
 // actual result: [text1, text3, text5, text8, number2]'
    , "':valid' matches elements that satisfy their constraints, <form>s/<fieldset>s with descendants that satisfy their constraints");
    
  testSelector(":invalid"
    , ["text2", "form2", "text4", "fieldset2", "text6", "text7", "number1"]
    , "':invalid' matches elements that do not satisfy their constraints, <form>s/<fieldset>s with descendants that do not satisfy their constraints");

  InputElement text7=document.getElementById("text7");
  text7.value="0BBB";
  testSelector(":valid"
    , ["text1", "form1", "text3", "fieldset1", "text5", "text7", "text8", "number2"]
    , "':valid' matches new elements that satisfy their constraints");
    
  testSelector(":invalid"
    , ["text2", "form2", "text4", "fieldset2", "text6", "number1"]
    , "':invalid' doesn't match new elements that satisfy their constraints");

  InputElement text8=document.getElementById("text8");
  text8.value="BBB";
  testSelector(":valid"
    , ["text1", "form1", "text3", "fieldset1", "text5", "text7", "number2"]
    , "':valid' doesn't match new elements that do not satisfy their constraints");
    
  testSelector(":invalid"
    , ["text2", "form2", "text4", "fieldset2", "text6", "text8", "number1"]
    , "':invalid' matches new elements that do not satisfy their constraints");
  
  checkTestFailures();
}
