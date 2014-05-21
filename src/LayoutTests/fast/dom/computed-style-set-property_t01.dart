/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  debug("Computed style parent (should be null)");
  shouldBeNull(document.body.getComputedStyle().parentRule);
  
  debug("Trying to change a computed style declaration.");
  shouldThrow(() => document.body.getComputedStyle().color = "blue");

  debug("Trying to change a computed style declaration via setProperty.");
  shouldThrow(() => document.body.getComputedStyle().setProperty("color", "blue"));
}
