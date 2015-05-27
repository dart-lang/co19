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
import "../../../Utils/async_utils.dart";

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

  shouldBe(document.body.queryAll("fieldset")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("input")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("button")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("select")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("textarea")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("output")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("object")[0].checkValidity(), true);
  shouldBe(document.body.queryAll("keygen")[0].checkValidity(), true);
}
