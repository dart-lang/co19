/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node lastChild
 * The last child of this node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Expect.equals(null, x.lastChild);
}

main() {
  List<Node> targets = [
    new IFrameElement(),
    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
