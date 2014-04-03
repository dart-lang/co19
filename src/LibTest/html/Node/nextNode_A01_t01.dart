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
  var x = new Comment("comment");
  document.body.append(x);
  Expect.isNull(x.nextNode);
  var y = new Text("text");
  document.body.append(y);
  Expect.equals(y, x.nextNode);
}
