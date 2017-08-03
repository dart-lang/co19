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

main() {
  IFrameElement x = new IFrameElement();
  Expect.equals(0, x.nodes.length);

  x.append(new DivElement());
  x.append(new Text("text"));
  x.append(new ParagraphElement());
  x.append(new Comment());

  List<Node> nodes = x.nodes;
  Expect.equals(4, nodes.length);
  Expect.isTrue(nodes[0] is DivElement);
  Expect.isTrue(nodes[1] is Text);
  Expect.isTrue(nodes[2] is ParagraphElement);
  Expect.isTrue(nodes[3] is Comment);
}
