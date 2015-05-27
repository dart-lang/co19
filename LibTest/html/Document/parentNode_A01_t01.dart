/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node parentNode
 * The parent node of this node.
 * Returns null if this node either does not have a parent or its parent is not an element.
 * @description Checks that document is not a child of any node.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isNull(document.parentNode);
}
