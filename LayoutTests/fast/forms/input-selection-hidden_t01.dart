/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      This tests the selection methods on the new text field when it is hidden and then made visible.
      <p>
      <input type="text" id="tf" style="visibility:hidden" value="123456789 ABCDEFGHIJ"></input>
      <div id="res"></div>
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());
    
  void test () {
    InputElement tf = document.getElementById('tf') as InputElement;

    tf.setSelectionRange(3, 12);
    shouldBe(tf.selectionStart, 3);
    shouldBe(tf.selectionEnd, 12);
    tf.style.visibility = "visible";
  }

  test();
}
