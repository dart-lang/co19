/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that Replaceable attributes are writable
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  //window.innerHeight = 42;
  //shouldBe(window.innerHeight, 42);
  //in dart it's final
  shouldThrow(() => (window as dynamic).innerHeight = 42);
}
