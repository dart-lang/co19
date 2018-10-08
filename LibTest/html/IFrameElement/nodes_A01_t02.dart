/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Node> nodes
 * A modifiable list of this node's children.
 * @description Checks that nodes list is modifiable.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  List<Node> nodes = x.nodes;

  nodes.add(new Text("t1"));
  nodes.add(new Comment());
  nodes.add(new Text("t2"));
  nodes.removeAt(0);
  nodes.removeAt(0);
  nodes.add(new DivElement());

  Expect.equals('<iframe>t2<div></div></iframe>', x.outerHtml);
}
