/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node clone(bool deep)
 * Returns a copy of this node.
 * MDN: The duplicate node returned by cloneNode() is not part of the document
 * until it is added to another node that is part of the document using
 * Node.appendChild() or a similar method. It also has no parent until it is
 * appended to another node.
 * @description Checks that parent is not set after clone.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new Element.html('<div><pre></pre></div>'));

  IFrameElement y = x.clone(false);
  Expect.isNull(y.parent, 'parent of shallow copy');

  y = x.clone(true);
  Expect.isNull(y.parent, 'parent of deep copy');
}
