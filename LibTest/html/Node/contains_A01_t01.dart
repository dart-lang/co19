/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Node other)
 * Returns true if this node contains the specified node.
 * @description Checks that node contains itself. 
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Expect.isTrue(x.contains(x));
}

main() {
  List<Node> targets = [
    new Text("Text1"),
    new Comment("Comment"),
    new IFrameElement(),
    document,
    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
