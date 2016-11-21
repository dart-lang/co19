/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the behavior of pattern attribute and pattern DOM
 * property.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;
  input.type = 'text';

  // No pattern attribute.
  shouldBe(input.pattern, "");

  // Set a string value.
  input.pattern = 'foo';
  shouldBe(input.getAttribute("pattern"), "foo");
  input.setAttribute('pattern', 'bar');
  shouldBe(input.pattern, "bar");
}
