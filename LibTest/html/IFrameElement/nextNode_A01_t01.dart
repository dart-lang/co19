/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node nextNode
 * The next sibling node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<iframe></iframe>');
  Expect.isNull(x.nextNode, "null");
  document.body.append(x);

  var y = new Text('text-node');
  document.body.append(y);
  var y1 = x.nextNode;
  Expect.equals(y, y1, "text added");
}
