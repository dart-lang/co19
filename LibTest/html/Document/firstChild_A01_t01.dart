/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node firstChild
 * The first child of this node.
 * @description Checks the content of firstChild.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.equals(document.childNodes[0], document.firstChild);
}
