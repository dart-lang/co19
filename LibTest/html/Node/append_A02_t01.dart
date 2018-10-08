/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * If the node already exists in this document, it will be removed from its 
 * current parent node, then added to this node.
 * @description Checks that existing node will be removed before append even if
 * it is not a direct child of this node.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void check(Node x) {
  var z = new Element.html('<span><div></div><button></button></span>');
  var y = z.querySelector('div');
  Expect.equals(2, z.nodes.length, "2");

  x.append(y);
  Expect.equals(1, z.nodes.length, "1");
  Expect.isTrue(z.firstChild is ButtonElement);
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
