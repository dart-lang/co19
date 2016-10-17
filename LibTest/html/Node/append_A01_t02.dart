/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * Adds a node to the end of the child nodes list of this node.
 * @description Checks expected lastChild after document.body.append(DocumentFragment)
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Node x = new DocumentFragment();
  document.body.append(x);
  print("last=${document.body.lastChild.runtimeType}");
  print("parent=${x.parentNode}");
  Expect.equals(document.body, x.parentNode, "after append $x");
}
