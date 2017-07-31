/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * If the node already exists in this document, it will be removed from its 
 * current parent node, then added to this node.
 * @description Checks that existing node will be removed before append
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var l0 = document.nodes.length;
  var x = new Element.html('<span><button></button></span>');
  var y = new Comment("cool");
  x.append(y);
  Expect.equals(y, x.lastChild);

  document.append(y);

  Expect.equals(l0 + 1, document.nodes.length);
  Expect.isTrue(x.firstChild is ButtonElement);
  Expect.equals(y, document.lastChild);
}
