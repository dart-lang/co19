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
 * after web-platform-tests/html/semantics/forms/textfieldselection/textfieldselection-setRangeText.html
 * @assertion http://www.w3.org/html/wg/drafts/html/master/#textFieldSelection
 * @description text field selection: setRangeText
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

/*
<style>
  #display_none {display:none;}
</style>
*/

const String htmlEL='''
<input type=text id=text value="foobar">
<input type=search id=search value="foobar">
<input type=tel id=tel value="foobar">
<input type=url id=url value="foobar">
<input type=password id=password value="foobar">
<input id=display_none value="foobar">
<textarea id=textarea>foobar</textarea>
''';

void main() {
  document.body.appendHtml(htmlEL);
  var input = document.createElement("input");
  input.id = "input_not_in_doc";
  input.value = "foobar";

  var elements = [
    document.getElementById("text"),
    document.getElementById("search"),
    document.getElementById("tel"),
    document.getElementById("url"),
    document.getElementById("password"),
    document.getElementById("display_none"),
    document.getElementById("textarea"),
    input,
  ];

  elements.forEach((element) {
    var q = false;

    test(() {
      element.value = "foobar";
      element.selectionStart = 0;
      element.selectionEnd = 3;
      assert_equals(element.selectionStart, 0);
      assert_equals(element.selectionEnd, 3);
      element.setRangeText("foobar2");
      assert_equals(element.value, "foobar2bar");
      assert_equals(element.selectionStart, 0);
      assert_equals(element.selectionEnd, 7);
      element.setRangeText("foobar3", start:7, end:10);
      assert_equals(element.value, "foobar2foobar3");
    }, element.id + " setRangeText with only one argument replaces the value between selectionStart and selectionEnd, otherwise replaces the value between 2nd and 3rd arguments");

    test((){
      element.value = "foobar";
      element.selectionStart = 0;
      element.selectionEnd = 0;

      element.setRangeText("foobar2", start:0, end:3); // no 4th arg, default "preserve"
      assert_equals(element.value, "foobar2bar");
      assert_equals(element.selectionStart, 0);
      assert_equals(element.selectionEnd, 0);
    }, element.id + " selectionMode missing");

    test((){
      element.value = "foobar";
      element.setRangeText("foo", start:3, end:6, selectionMode:"select");
      assert_equals(element.value, "foofoo");
      assert_equals(element.selectionStart, 3);
      assert_equals(element.selectionEnd, 6);
    }, element.id + " selectionMode 'select'");

    test((){
      element.value = "foobar";
      element.setRangeText("foo", start:3, end:6, selectionMode:"start");
      assert_equals(element.value, "foofoo");
      assert_equals(element.selectionStart, 3);
      assert_equals(element.selectionEnd, 3);
    }, element.id + " selectionMode 'start'");

    test((){
      element.value = "foobar";
      element.setRangeText("foobar", start:3, end:6, selectionMode:"end");
      assert_equals(element.value, "foofoobar");
      assert_equals(element.selectionStart, 9);
      assert_equals(element.selectionEnd, 9);
    }, element.id + " selectionMode 'end'");

    test((){
      element.value = "foobar";
      element.selectionStart = 0;
      element.selectionEnd = 5;
      assert_equals(element.selectionStart, 0);
      element.setRangeText("", start:3, end:6, selectionMode:"preserve");
      assert_equals(element.value, "foo");
      assert_equals(element.selectionStart, 0);
      assert_equals(element.selectionEnd, 3);
    }, element.id + " selectionMode 'preserve'");

    test((){
      assert_throws("IndexSizeError", () {
        element.setRangeText("barfoo", start:2, end:1);
      });
    }, element.id + " setRangeText with 3rd argument greater than 2nd argument throws an IndexSizeError exception");

    test((){
      assert_throws("NoSuchMethodError", () {
        element.setRangeText();
      });
    }, element.id + " setRangeText without argument throws a type error");

//    element.onselect = t.step_func_done((e) {
    element.onSelect.forEach((e) {
      test(() {
        assert_true(q, "event should be queued");
        assert_true(e.isTrusted, "event is trusted");
        assert_false(e.bubbles, "event bubbles");
        assert_false(e.cancelable, "event is not cancelable");
      }, element.id + " setRangeText fires a select event");
    });
    
    element.setRangeText("foobar2", start:0, end:6);
    q=true;
  });

  checkTestFailures();
}
