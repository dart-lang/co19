/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test changes the value of the text field by simulating
 * typing, and then gets the value.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <input type="text" id="sp" style="-khtml-appearance:textfield" maxlength=5 value="123456"></input>
      ''', treeSanitizer: new NullTreeSanitizer());

  var input = document.getElementById('sp');

  if (input.value != "12345") {
    testPassed('Maxlength shouldn\'t work for default value.');
  } else {
    testFailed('Maxlength unexpectedly works for default value.');
  }

  input.value = "123";
  input.setSelectionRange(0, 3);
  input.focus();
  document.execCommand("InsertText", false, 'abcd');
  document.execCommand("InsertText", false, 'efghi');

  if (input.value == "abcde") {
    testPassed('Maxlength works for inserted text.');
  } else {
    testFailed('Maxlength does not work for inserted text.');
  }
}
