/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * Adds a node to the end of the child nodes list of this node.
 * http://www.w3.org/: Document can have Element (maximum of one),
 * ProcessingInstruction, Comment, DocumentType
 * @description Checks expected lastChild after append
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var x = new Comment("cool");
  document.append(x);
  Expect.equals(x, document.lastChild);
}
