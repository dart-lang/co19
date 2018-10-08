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

main() {
  var l0 = document.nodes.length;
  var x = new Element.html('<span><button><div></div></button></span>');
  var y = x.querySelector('div');
  var z = new Comment("cool");
  y.append(z);
  Expect.equals(z, y.lastChild);
  Expect.isNotNull(y.firstChild);

  document.append(z);

  Expect.isNull(y.firstChild);
  Expect.equals(l0 + 1, document.nodes.length);
  Expect.isTrue(x.firstChild is ButtonElement);
  Expect.equals(z, document.lastChild);
}
