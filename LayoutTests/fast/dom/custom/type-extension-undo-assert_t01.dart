/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that execCommand undo doesn't hork custom elements
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test" contenteditable><b is="x-a" style="font-style: italic;">Hello, world!</b></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  // This test is based on
  // editing/undo/replace-by-span-then-remove.html. Fuzzing tickled an
  // assert; this is the reduced test case. Bolding will swap the B for
  // a SPAN; undoing and redoing the command will reapply the "is"
  // attribute to the original custom element.

  var test = document.getElementById('test');
  window.getSelection().selectAllChildren(test);
  document.execCommand('bold', false, null);
  document.execCommand('undo', false, null);
  document.execCommand('undo', false, null);

  testPassed('did not crash');
}
