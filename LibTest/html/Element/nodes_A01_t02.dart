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
  var x = document.body;
  x.innerHtml = 'text node<p></p>';

  x.nodes.removeAt(0);
  x.nodes.removeAt(0);
  x.nodes.add(new DivElement());

  Expect.equals('<body><div></div></body>', x.outerHtml);
}
