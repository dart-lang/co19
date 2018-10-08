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
      This test changes the value of the text field by simulating typing, and then gets the value.
      <br><br>
      <input type="text" id="sp" style="-khtml-appearance:textfield"></input>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('sp').focus();
  document.execCommand("InsertText", false, 'Test');

  InputElement input = document.getElementById('sp');

  shouldBe(input.value, "Test");
}
