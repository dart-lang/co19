/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if checkValidity() returns correctly a false
 * (meaning there's an invalid element) result on form element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <form method="get" id="sad_form">
      <fieldset name="victim"></fieldset>
      <input name="victim" type="text" value="invalid" pattern="something"/>
      <button name="victim">lorem ipsum</button>
      <select name="victim"></select>
      <textarea name="victim"></textarea>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  FormElement f = document.getElementById("sad_form") as FormElement;
  shouldBe(f.checkValidity(), false);
}
