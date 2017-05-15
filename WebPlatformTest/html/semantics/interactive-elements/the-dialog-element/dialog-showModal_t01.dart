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
 * after web-platform-tests/html/semantics/interactive-elements/the-dialog-element/dialog-showModal.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/#the-dialog-element
 * @description dialog element: showModal()
 * @note api bug #19638:: document.getElementById('d1') returns UnknownElement instead of DialogElement
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<button id="b0">OK</button>
<dialog id="d1">
  <p>foobar</p>
  <button id="b1">OK</button>
</dialog>
<dialog id="d2" open>
  <p>foobar</p>
  <button>OK</button>
</dialog>
<dialog id="d3">
  <p>foobar</p>
  <button id="b3">OK</button>
</dialog>
<dialog id="d4">
  <p>foobar</p>
  <button id="b4">OK</button>
</dialog>
<dialog id="d5">
  <p>foobar</p>
  <button id="b5">OK</button>
</dialog>
<dialog id="d6"></dialog>
<dialog id="d7">
  <input id="i71" value="foobar">
  <input id="i72" value="foobar">
  <button id="b7">OK</button>
</dialog>
<dialog id="d8">
  <input id="i81" value="foobar">
  <input id="i82" value="foobar" autofocus>
  <button id="b8">OK</button>
</dialog>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  var d1 = document.getElementById('d1'),
      d2 = document.getElementById('d2'),
      d3 = document.getElementById('d3'),
      d4 = document.getElementById('d4'),
      d5 = document.getElementById('d5'),
      d6 = document.getElementById('d6'),
      d7 = document.getElementById('d7'),
      d8 = document.getElementById('d8'),
      b0 = document.getElementById('b0'),
      b3 = document.getElementById('b3'),
      b4 = document.getElementById('b4'),
      b5 = document.getElementById('b5');

  test((){
    assert_false(d1.open);
    assert_false(b0.commandDisabled);
    d1.showModal();
    assert_true(d1.open);
    assert_true(b0.commandDisabled);
    assert_equals(document.activeElement, d1.firstChild);
  }, "d1");

  test((){
    assert_throws("INVALID_STATE_ERR", () {
      d2.showModal();
    });
  }, "showModal() on a <dialog> that already has an open attribute throws an InvalidStateError exception");

  test((){
    var d = document.createElement("dialog");
    assert_throws("INVALID_STATE_ERR", () {
      d.showModal();
    });
  }, "showModal() on a <dialog> not in a Document throws an InvalidStateError exception");

  test((){
    assert_false(d3.open);
    assert_false(b3.commandDisabled);
    assert_false(d4.open);
    assert_false(b4.commandDisabled);
    assert_false(d5.open);
    assert_false(b5.commandDisabled);
    d3.showModal();
    d4.showModal();
    d5.showModal();
    assert_true(d3.open);
    assert_true(b3.commandDisabled);
    assert_true(d4.open);
    assert_true(b4.commandDisabled);
    assert_true(d5.open);
    assert_false(b5.commandDisabled);
  }, "when opening multiple dialogs, only the newest one is non-inert");

  test((){
    assert_false(d6.open);
    d6.showModal();
    assert_true(d6.open);
    assert_equals(document.activeElement, d6);
  }, "opening dialog without focusable children");

  test((){
    assert_false(d7.open);
    d7.showModal();
    assert_true(d7.open);
    assert_equals(document.activeElement, document.getElementById("i71"));
  }, "opening dialog with multiple focusable children");

  test((){
    assert_false(d8.open);
    d8.showModal();
    assert_true(d8.open);
    assert_equals(document.activeElement, document.getElementById("i82"));
  }, "opening dialog with multiple focusable children, one having the autofocus attribute");
  
  d1.close();
  d2.close();
  d3.close();
  d4.close();
  d5.close();
  d6.close();
  d7.close();
  d8.close();

  checkTestFailures();
}
