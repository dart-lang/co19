/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String nodeName
 * The name of this node.
 * This varies by this node's nodeType:
 * text -- "#text"
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.equals("#text", new Text('text').nodeName, 'ctor');

  var x = document.body;
  x.innerHtml = 'text node';

  Expect.equals("#text", x.firstChild.nodeName, 'parsed');
}
