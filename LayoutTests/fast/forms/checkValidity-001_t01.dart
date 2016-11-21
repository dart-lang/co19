/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if checkValidity() returns correctly a true
 * (meaning no error) result.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <form method="get">
      <fieldset name="victim"></fieldset>
      <input name="victim" type="text" value="lorem ipsum"/>
      <button name="victim">lorem ipsum</button>
      <select name="victim"></select>
      <textarea name="victim"></textarea>
      <output name="victim"></output>
      <object name="victim"></object>
      <keygen name="victim"></keygen>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe((document.body.querySelectorAll("fieldset")[0] as FieldSetElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("input")[0] as InputElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("button")[0] as ButtonElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("select")[0] as SelectElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("textarea")[0] as TextAreaElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("output")[0] as OutputElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("object")[0] as ObjectElement).checkValidity(), true);
  shouldBe((document.body.querySelectorAll("keygen")[0] as KeygenElement).checkValidity(), true);
}
