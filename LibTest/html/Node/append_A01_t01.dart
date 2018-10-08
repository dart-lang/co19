/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * Adds a node to the end of the child nodes list of this node.
 * @description Checks expected lastChild after append
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  Comment y = new Comment("Comment");
  x.append(y);
  Expect.equals(y, x.lastChild);

  Text z = new Text('text');
  x.append(z);
  Expect.equals(z, x.lastChild);
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
