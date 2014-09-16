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
 * after web-platform-tests/html/semantics/forms/textfieldselection/selection.html
 * @assertion http://www.whatwg.org/specs/web-apps/current-work/multipage/association-of-controls-and-forms.html#textFieldSelection
 * @description text field selection: select()
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var body = document.getElementsByTagName("body").item(0);
  var dirs = ['forward', 'backward', 'none'];
  var sampleText = "0123456789";

  Element createInputElement(value) {
    var el = document.createElement("input");
    el.type = "text";
    el.value = value;
    body.append(el);
    return el;
  }

  Element createTextareaElement(value) {
    var el = document.createElement("textarea");
    el.value = value;
    body.append(el);
    return el;
  }

  test(() {
    var text = 'a';
    for (var i=0; i<255; i++) {
      var el = createInputElement(text);
      el.select();
      var selectionText = el.value.substring(el.selectionStart, el.selectionEnd);
      assert_equals(selectionText, text, "Selection text mismatched");
      el.remove();
      text += 'a';
    }
  }, "test if selection text is correct for input");


  test(() {
    var text = 'a';
    for (var i=0; i<255; i++) {
      var el = createTextareaElement(text);
      el.select();
      var selectionText = el.value.substring(el.selectionStart, el.selectionEnd);
      assert_equals(selectionText, text, "Selection text mismatched");
      el.remove();
      text += 'a';
    }
  }, "test if selection text is correct for textarea");


  test(() {
    var text = 'あ';
    for (var i=0; i<255; i++) {
      var el = createInputElement(text);
      el.select();
      var selectionText = el.value.substring(el.selectionStart, el.selectionEnd);
      assert_equals(selectionText, text, "Selection text mismatched");
      el.remove();
      text += 'あ';
    }
  }, "test if non-ascii selection text is correct for input");


  test(() {
    var text = 'あ';
    for (var i=0; i<255; i++) {
      var el = createTextareaElement(text);
      el.select();
      var selectionText = el.value.substring(el.selectionStart, el.selectionEnd);
      assert_equals(selectionText, text, "Selection text mismatched");
      el.remove();
      text += 'あ';
    }
  }, "test if non-ascii selection text is correct for textarea");


  test(() {
    var el = createInputElement(sampleText);
    // If there is no selection, then it must return the offset(in logical order)
    // to the character that immediately follows the text entry cursor.
    assert_equals(el.selectionStart, el.value.length, "SelectionStart offset without selection");
    el.select();
    assert_equals(el.selectionStart, 0, "SelectionStart offset");
    el.remove();
  }, "test SelectionStart offset for input");


  test(() {
    var el = createTextareaElement(sampleText);
    // If there is no selection, then it must return the offset(in logical order)
    // to the character that immediately follows the text entry cursor.
    assert_equals(el.selectionStart, el.value.length, "SelectionStart offset without selection");
    el.select();
    assert_equals(el.selectionStart, 0, "SelectionStart offset");
    el.remove();
  }, "test SelectionStart offset for textarea");


  test(() {
    var el = createInputElement(sampleText);
    // If there is no selection, then it must return the offset(in logical order)
    // to the character that immediately follows the text entry cursor.
    assert_equals(el.selectionEnd, el.value.length, "SelectionEnd offset without selection");
    el.select();
    assert_equals(el.selectionEnd, el.value.length, "SelectionEnd offset");
    el.remove();
  }, "test SelectionEnd offset for input");


  test(() {
    var el = createTextareaElement(sampleText);
    // If there is no selection, then it must return the offset(in logical order)
    // to the character that immediately follows the text entry cursor.
    assert_equals(el.selectionEnd, el.value.length, "SelectionEnd offset without selection");
    el.select();
    assert_equals(el.selectionEnd, el.value.length, "SelectionEnd offset");
    el.remove();
  }, "test SelectionEnd offset for textarea");


  test(() {
    var el = createInputElement(sampleText);
    assert_in_array(el.selectionDirection, dirs, "SelectionDirection");
    el.select();
    assert_in_array(el.selectionDirection, dirs, "SelectionDirection");
    el.remove();
  }, "test SelectionDirection for input");


  test(() {
    var el = createInputElement(sampleText);
    assert_in_array(el.selectionDirection, dirs, "SelectionDirection");
    el.select();
    assert_in_array(el.selectionDirection, dirs, "SelectionDirection");
    el.remove();
  }, "test SelectionDirection for textarea");

  checkTestFailures();
}
