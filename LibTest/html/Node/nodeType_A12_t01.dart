/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int nodeType
 * The type of node.
 * This value is one of:
 * TEXT_NODE if this node is a Text node.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.equals(Node.TEXT_NODE, new Text('text').nodeType, 'ctor');

  var x = document.body;
  x.innerHtml = 'text node';

  Expect.equals(Node.TEXT_NODE, x.firstChild.nodeType, 'parsed');
}
