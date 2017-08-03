/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Node> nodes
 * A modifiable list of this node's children.
 * @description Checks the content of nodes.
 * Checks that the list is modifiable.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var nodes = document.nodes;
  Expect.listEquals(document.childNodes, nodes);
  var l0 = nodes.length;
  var node0 = nodes[0];
  var res = nodes.remove(node0);
  Expect.isTrue(res);
  Expect.equals(l0 - 1, nodes.length);
  nodes.insert(0, node0);
  Expect.equals(l0, nodes.length);
}
