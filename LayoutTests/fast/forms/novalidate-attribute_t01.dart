/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test performs some simple check on the noValidate
 * attribute.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  FormElement f = document.createElement("form") as FormElement;

  shouldBe(f.attributes.containsKey('noValidate'), false);
  shouldBe(f.getAttribute('noValidate'), null);
  shouldBe(f.noValidate, false);

  f.noValidate = true;

  shouldBe(f.attributes.containsKey('noValidate'), true);
  shouldBe(f.getAttribute('noValidate'), '');
  shouldBe(f.noValidate, true);

  FormElement f2 = document.createElement("form") as FormElement;
  f2.noValidate = f.noValidate;

  f.noValidate = false;

  shouldBe(f.attributes.containsKey('noValidate'), false);
  shouldBe(f.getAttribute('noValidate'), null);
  shouldBe(f.noValidate, false);

  shouldBe(f2.attributes.containsKey('noValidate'), true);
  shouldBe(f2.getAttribute('noValidate'), '');
  shouldBe(f2.noValidate, true);

  f2.noValidate = false;

  shouldBe(f2.noValidate, false);
  /*
  f2.noValidate = "something";
  shouldBe(f2.attributes.containsKey('noValidate'), true);
  shouldBe(f2.getAttribute('noValidate'), '');
  shouldBe(f2.noValidate, true);
  */
}
