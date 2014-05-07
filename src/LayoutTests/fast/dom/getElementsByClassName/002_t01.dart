/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): also simple
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.documentElement.className = "a";
  document.body.className = "a\n";

  shouldBeList(document.getElementsByClassName("a\n"),
      [document.documentElement, document.body]);
}
