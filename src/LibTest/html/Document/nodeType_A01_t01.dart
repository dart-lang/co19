/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int nodeType
 * The type of node.
 * This value is one of:
 * DOCUMENT_NODE if this node is a Document.
 * @description Checks the value of nodeType.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.equals(Node.DOCUMENT_NODE, document.nodeType);
}
