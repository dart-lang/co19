/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node clone(bool deep)
 * Returns a copy of this node.
 * If deep is true, then all of this node's children and decendents are copied
 * as well. If deep is false, then only this node is copied.
 * @description Checks shallow copy
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var y = x.clone(false);
  Expect.identical(x.firstChild, y.firstChild);
  Expect.identical(x.lastChild, y.lastChild);
}

main() {
  List<Node> targets = [
    new Text("Text1"),
    new Comment("Comment"),
    new DocumentFragment(),
  ];
  for (Node x in targets) {
    check(x);
  }
}
