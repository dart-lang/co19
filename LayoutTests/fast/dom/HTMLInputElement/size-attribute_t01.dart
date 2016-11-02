/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTMLInputElement size attribute test
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  sizeAttributeEffect(value)
  {
    InputElement element = document.createElement("input");
    element.setAttribute("size", value);
    return element.size;
  }

  shouldBe((document.createElement("input") as InputElement).size, 20);

  shouldBe(sizeAttributeEffect(""), 20);

  shouldBe(sizeAttributeEffect("1"), 1);
  shouldBe(sizeAttributeEffect("2"), 2);
  shouldBe(sizeAttributeEffect("10"), 10);

  shouldBe(sizeAttributeEffect("0"), 20);

  shouldBe(sizeAttributeEffect("-1"), 20);

  shouldBe(sizeAttributeEffect("1x"), 1);
  shouldBe(sizeAttributeEffect("1."), 1);
  shouldBe(sizeAttributeEffect("1.9"), 1);
  shouldBe(sizeAttributeEffect("2x"), 2);
  shouldBe(sizeAttributeEffect("2."), 2);
  shouldBe(sizeAttributeEffect("2.9"), 2);

  shouldBe(sizeAttributeEffect("a"), 20);

  var arabicIndicDigitOne = new String.fromCharCode(0x661);
  shouldBe(sizeAttributeEffect(arabicIndicDigitOne), 20);
  shouldBe(sizeAttributeEffect("2" + arabicIndicDigitOne), 2);
}

