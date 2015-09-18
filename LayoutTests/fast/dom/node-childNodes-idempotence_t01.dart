/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that Node.childNodes returns the same
 * NodeList when called repeatedly.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  shouldBe(document.documentElement.childNodes,
      document.documentElement.childNodes);
}
