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
 * @description Checks deep copy
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new Element.html('<div><pre></pre>text</div>'));
  var y = x.clone(true);

  Expect.isTrue(y is IFrameElement, 'IFrameElement');

  y = y.firstChild;
  Expect.isTrue(y is DivElement, 'div');

  y = y.nextNode;
  Expect.isTrue(y is PreElement, 'pre');

  y = y.nextNode;
  Expect.isTrue(y is Text, 'text');

  y = y.nextNode;
  Expect.isNull(y);
}
