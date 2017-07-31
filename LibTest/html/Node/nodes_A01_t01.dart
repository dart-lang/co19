/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Node> nodes
 * A modifiable list of this node's children.
 * @description Checks expected children.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var y = new Comment("Comment");
  var z = new Text('text');
  x.append(y);
  x.append(z);
  List<Node> nodes = x.nodes;
  Expect.isTrue(nodes.contains(y));
  Expect.isTrue(nodes.contains(z));
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
