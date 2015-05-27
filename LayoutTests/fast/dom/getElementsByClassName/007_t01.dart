/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): multiple classes
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.className = "a b";

  shouldBeList(document.getElementsByClassName("b\t\f\n\na\rb"),
      [document.body]);
}
