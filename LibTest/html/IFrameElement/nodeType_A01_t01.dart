/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int nodeType
 * The type of node.
 * This value is one of:
 * ELEMENT_NODE if this node is an Element.
 * @description Checks expected attribute values.
 * @note tbd
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<iframe></iframe>');
  Expect.equals(Node.ELEMENT_NODE, x.nodeType);
}
