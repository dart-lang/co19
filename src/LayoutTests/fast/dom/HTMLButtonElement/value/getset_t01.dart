/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test changes the value of the button.
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>Tests: HTMLButtonElement::value</p>
    <input type=button id='button' value='Fail'></input>
    ''', treeSanitizer: new NullTreeSanitizer());

  var but = document.getElementById('button');
  but.value = 'Success';
  Expect.equals('Success', but.value);
}
