/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String nodeName
 * The name of this node.
 * This varies by this node's nodeType.
 * MDN: Interface:Document	nodeName:"#document"
 * @description Checks the value of document.nodeName.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  Expect.equals("#document", document.nodeName);
}
