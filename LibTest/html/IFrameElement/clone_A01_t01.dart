/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node clone(bool deep)
 * Returns a copy of this node.
 * If deep is true, then all of this node's children and decendents are copied
 * as well. If deep is false, then only this node is copied.
 * @description Checks shallow copy
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new Element.html('<div><pre></pre>text</div>'));
  var y = x.clone(false);
  Expect.listEquals([], y.nodes);
}
