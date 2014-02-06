/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasChildNodes()
 * Returns true if this node has any children.
 * @description Checks the content of nodes.
 * Checks that working document alway has child nodes.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(document.hasChildNodes());
}
