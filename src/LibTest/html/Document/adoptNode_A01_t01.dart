/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node adoptNode(Node source)
 * Adopt node from an external document
 * Adds a node to the end of the list of children of a specified parent node.
 * http://www.w3.org/: Document can have Element (maximum of one),
 * ProcessingInstruction, Comment, DocumentType
 * @description Checks expected lastChild after append
 * @needsreview issue #16409
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  Documend d2=document.clone(true);
  var x = new Comment("cool");
  d2.adoptNode(x);
  document.adoptNode(x);
  Expect.equals(x, document.lastChild);
}
