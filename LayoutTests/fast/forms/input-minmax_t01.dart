/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the behavior of .min and .max of HTMLInputElement.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;

  // .min and .max just reflect the corresponding attributes.
  input.type = 'text';
  shouldBe(input.min, "");
  shouldBe(input.max, "");
  input.setAttribute('min', '0');
  input.setAttribute('max', '100');
  shouldBe(input.min, "0");
  shouldBe(input.max, "100");
  input.setAttribute('min', 'abc');
  input.setAttribute('max', 'qwerty');
  shouldBe(input.min, "abc");
  shouldBe(input.max, "qwerty");

  input.min = 'foo';
  input.max = 'bar';
  shouldBe(input.getAttribute("min"), "foo");
  shouldBe(input.getAttribute("max"), "bar");
  input.min = '';
  input.max = '';
  shouldBe(input.getAttribute("min"), "");
  shouldBe(input.getAttribute("max"), "");


  // The range type has the default minimum and the default maximum.
  // But they aren't exposed by .min .max IDL attributes.
  debug('Check implicit min/max of type=range:');
  input.type = 'range';
  input.setAttribute('min', '');
  input.setAttribute('max', '');
  shouldBe(input.min, "");
  shouldBe(input.max, "");
}
