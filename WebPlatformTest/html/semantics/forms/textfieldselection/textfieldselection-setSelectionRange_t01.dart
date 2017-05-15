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
 * after web-platform-tests/html/semantics/forms/textfieldselection/textfieldselection-setSelectionRange.dart.html
 * @assertion http://www.w3.org/html/wg/drafts/html/CR/forms.html#dom-textarea/input-setselectionrange
 * @description Test of text field setSelectionRange
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

/*
<style>
  #display_none {display:none;}
</style>
*/

const String htmlEL='''
<div id="hide" style="display: block">
  <input id="a" type="text" value="abcde">
  <textarea id="b">abcde</textarea>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  var input = document.getElementById("a");

  test(() {
    input.setSelectionRange(0,1);
    assert_equals(input.selectionStart, 0, "element.selectionStart should be 0");
    assert_equals(input.selectionEnd, 1, "element.selectionEnd should be 1");
  },'input setSelectionRange(0,1)');

  test(() {
    input.setSelectionRange(0,input.value.length+1);
    assert_equals(input.selectionEnd, input.value.length, "Arguments greater than the length of the value of the text field must be treated as pointing at the end of the text field");
  },'input setSelectionRange(0,input.value.length+1)');

  test(() {
    input.setSelectionRange(2,2);
    assert_equals(input.selectionStart, 2, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
    assert_equals(input.selectionEnd, 2, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
  },'input setSelectionRange(2,2)');

  test(() {
    input.setSelectionRange(2,1);
    assert_equals(input.selectionStart, 1, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
    assert_equals(input.selectionEnd, 1, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
  },'input setSelectionRange(2,1)');

  test(() {
    input.setSelectionRange(0,1,"backward");
    assert_equals(input.selectionDirection, "backward", 'The direction of the selection must be set to backward if direction is a case-sensitive match for the string "backward"');
  },'input direction of setSelectionRange(0,1,"backward")');

  test(() {
    input.setSelectionRange(0,1,"forward");
    assert_equals(input.selectionDirection, "forward", 'The direction of the selection must be set to forward if direction is a case-sensitive match for the string "forward"');
  },'input direction of setSelectionRange(0,1,"forward")');

  test(() {
    input.setSelectionRange(0,1,"none");
    assert_equals(input.selectionDirection, "none", 'The direction of the selection must be set to forward if direction is a case-sensitive match for the string "none"');
  },'input direction of setSelectionRange(0,1,"none")');

  test(() {
    input.setSelectionRange(0,1,"hoge");
    assert_equals(input.selectionDirection, "none", "otherwise");
  },'input direction of setSelectionRange(0,1,"hoge")');

  test(() {
    input.setSelectionRange(0,1,"BACKWARD");
    assert_equals(input.selectionDirection, "none", "selectionDirection should be 'none'");
  },'input direction of setSelectionRange(0,1,"BACKWARD")');

  test(() {
    input.setSelectionRange(0,1);
    assert_equals(input.selectionDirection, "none", "if the argument is omitted");
  },'input direction of setSelectionRange(0,1)');

  var textarea = document.getElementById("b");

  test(() {
    textarea.setSelectionRange(0,1);
    assert_equals(textarea.selectionStart, 0, "element.selectionStart should be 0");
    assert_equals(textarea.selectionEnd, 1, "element.selectionEnd should be 1");
  },'textarea setSelectionRange(0,1)');

  test(() {
    textarea.setSelectionRange(0,textarea.value.length+1);
    assert_equals(textarea.selectionEnd, textarea.value.length, "Arguments greater than the length of the value of the text field must be treated as pointing at the end of the text field");
  },'textarea setSelectionRange(0,textarea.value.length+1)');

  test(() {
    textarea.setSelectionRange(2,2);
    assert_equals(textarea.selectionStart, 2, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
    assert_equals(textarea.selectionEnd, 2, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
  },'textarea setSelectionRange(2,2)');

  test(() {
    textarea.setSelectionRange(2,1);
    assert_equals(textarea.selectionStart, 1, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
    assert_equals(textarea.selectionEnd, 1, "If end is less than or equal to start then the start of the selection and the end of the selection must both be placed immediately before the character with offset end");
  },'textarea setSelectionRange(2,1)');

  test(() {
    textarea.setSelectionRange(0,1,"backward");
    assert_equals(textarea.selectionDirection, "backward", 'The direction of the selection must be set to backward if direction is a case-sensitive match for the string "backward"');
  },'textarea direction of setSelectionRange(0,1,"backward")');

  test(() {
    textarea.setSelectionRange(0,1,"forward");
    assert_equals(textarea.selectionDirection, "forward", 'The direction of the selection must be set to forward if direction is a case-sensitive match for the string "forward"');
  },'textarea direction of setSelectionRange(0,1,"forward")');

  test(() {
    textarea.setSelectionRange(0,1,"none");
    assert_equals(textarea.selectionDirection, "none", 'The direction of the selection must be set to forward if direction is a case-sensitive match for the string "none"');
  },'textarea direction of setSelectionRange(0,1,"none")');

  test(() {
    textarea.setSelectionRange(0,1,"hoge");
    assert_equals(textarea.selectionDirection, "none", "otherwise");
  },'textarea direction of setSelectionRange(0,1,"hoge")');

  test(() {
    textarea.setSelectionRange(0,1,"BACKWARD");
    assert_equals(textarea.selectionDirection, "none", "selectionDirection should be 'none'");
  },'textarea direction of setSelectionRange(0,1,"BACKWARD")');

  test(() {
    textarea.setSelectionRange(0,1);
    assert_equals(textarea.selectionDirection, "none", "if the argument is omitted");
  },'textarea direction of setSelectionRange(0,1)');

  checkTestFailures();
}
