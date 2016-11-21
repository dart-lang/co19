/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks fieldset.name attribute.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <fieldset id="fs1" name="a"></fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  FieldSetElement fs1 = document.getElementById('fs1') as FieldSetElement;

  debug("Read from HTML");
  shouldBe(fs1.name, "a");
  shouldBe(fs1.getAttribute("name"), "a");

  debug('fs1.name="b"');
  fs1.name = "b";
  shouldBe(fs1.name, "b");
  shouldBe(fs1.getAttribute("name"), "b");
}
