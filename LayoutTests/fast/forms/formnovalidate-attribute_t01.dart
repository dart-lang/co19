/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test performs some simple check on the formnovalidate
 * attribute.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement i = document.createElement("input") as InputElement;
  ButtonElement b = document.createElement("button") as ButtonElement;

  shouldBe(i.attributes.containsKey('formNoValidate'), false);
  shouldBe(i.getAttribute('formNoValidate'), null);
  shouldBe(i.formNoValidate, false);
  shouldBe(b.attributes.containsKey('formNoValidate'), false);
  shouldBe(b.getAttribute('formNoValidate'), null);
  shouldBe(b.formNoValidate, false);

  i.formNoValidate = true;
  b.formNoValidate = true;

  shouldBe(i.attributes.containsKey('formNoValidate'), true);
  shouldBe(i.getAttribute('formNoValidate'), '');
  shouldBe(i.formNoValidate, true);
  shouldBe(b.attributes.containsKey('formNoValidate'), true);
  shouldBe(b.getAttribute('formNoValidate'), '');
  shouldBe(b.formNoValidate, true);

  InputElement i2 = document.createElement("input") as InputElement;
  i2.formNoValidate = i.formNoValidate;

  i.formNoValidate = false;
  b.formNoValidate = false;

  shouldBe(i.attributes.containsKey('formNoValidate'), false);
  shouldBe(i.getAttribute('formNoValidate'), null);
  shouldBe(i.formNoValidate, false);
  shouldBe(b.attributes.containsKey('formNoValidate'), false);
  shouldBe(b.getAttribute('formNoValidate'), null);
  shouldBe(b.formNoValidate, false);

  i2.formNoValidate = false;
  shouldBe(i2.formNoValidate, false);
}
