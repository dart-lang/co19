/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that elements can be fetched by index from
 * HTMLFormElements.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form id='f'>
      <input type="radio" name="a" value="a" id="i">HTMLInputElement</input>
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());


  var form = document.getElementById('f');
  var my_input = document.getElementById('i');
  //shouldBe(form[0], my_input);
}
