/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * If the node already exists in this document, it will be removed from its 
 * current parent node, then added to this node.
 * @description Checks that existing node will be removed before append.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  document.body.append(x);
  var h = new Element.html('<span><div></div>append_02_02</span>');
  var y = h.querySelector('div');

  Expect.equals(h, y.parent);

  x.append(y);

  Expect.equals(x, y.parent);
}
