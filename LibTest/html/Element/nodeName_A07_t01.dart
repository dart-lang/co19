/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String nodeName
 * The name of this node.
 * This varies by this node's nodeType:
 * Element -- same as Element.tagName
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.equals('DIV', new DivElement().nodeName, 'ctor');

  Expect.equals('DIV', new Element.html('<div></div>').nodeName, 'parsed');
}
