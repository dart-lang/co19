/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if checkValidity() returns correctly a true
 * (meaning no error) result on form element.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get" id="happy_form">
      <fieldset name="victim"></fieldset>
      <input name="victim" type="text" value="lorem ipsum"/>
      <button name="victim">lorem ipsum</button>
      <select name="victim"></select>
      <textarea name="victim"></textarea>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var f = document.getElementById("happy_form");
  shouldBe(f.checkValidity(), true);
}
