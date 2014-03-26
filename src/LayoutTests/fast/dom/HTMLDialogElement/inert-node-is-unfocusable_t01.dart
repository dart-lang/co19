/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that inert nodes are not focusable. The test passses 
 * if only the document body and the topmost dialog and its button are 
 * focusable.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setAttribute('id', 'body');
  document.body.setAttribute('tabindex', '1');
  document.body.setInnerHtml('''
    <dialog id="top-dialog" tabindex="1" style="width: 100px; top: 30px"><button id="top-dialog-button">I get focus</button></dialog>
    <dialog id="bottom-dialog" tabindex="-1" style="width: 100px; bottom: 30px"><button id="bottom-dialog-button">I don't get focus.</button></dialog>
    <div id="container">
        <input id="text" type="text">
        <input id="datetime" type="datetime">
        <input id="color" type="color">
        <select id="select">
            <optgroup id="optgroup">
                <option id="option">Option</option>
            </optgroup>
        </select>
        <div id="contenteditable-div" contenteditable>I'm editable</div>
        <span id="tabindex-span" tabindex="0">I'm tabindexed.</div>
        <embed id="embed" type="application/x-webkit-test-netscape" width=100 height=100></embed>
        <a id="anchor" href="">Link</a>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  testFocus(element, expectFocus) {
    var focusedElement = null;
    element.addEventListener('focus', () { focusedElement = element; }, false);
    element.focus();
    var theElement = element;
    debug(element.id);
    shouldBe(focusedElement == theElement, expectFocus);
  }

  testTree(element, expectFocus) {
    if (element.nodeType == Node.ELEMENT_NODE)
      testFocus(element, expectFocus);
    var childNodes = element.childNodes;
    for (var i = 0; i < childNodes.length; i++)
      testTree(childNodes[i], expectFocus);
  }

  var bottomDialog = document.getElementById('bottom-dialog');
  bottomDialog.showModal();

  var topDialog = document.getElementById('top-dialog');
  topDialog.showModal();

  testFocus(document.body, true);
  testTree(topDialog, true);
  testTree(bottomDialog, false);
  testTree(document.getElementById('container'), false);
}
