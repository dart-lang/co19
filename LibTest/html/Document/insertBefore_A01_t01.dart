/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node insertBefore(Node newChild, Node refChild)
 * Inserts node into this node directly before refChild.
 * from MDN: var insertedElement = parentElement.insertBefore(newElement, referenceElement);
 * - insertedElement The node being inserted, that is newElement
 * - parentElement The parent of the newly inserted node.
 * - newElement The node to insert.
 * - referenceElement The node before which newElement is inserted.
 * http://www.w3.org/: Document can have Element (maximum of one),
 * ProcessingInstruction, Comment, DocumentType
 * @description Checks expected dom after insert
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Comment("cool");
  document.insertBefore(x, document.firstChild);
  Expect.equals(document.firstChild, x, 'insert before existing child');

  Expect.throws(() {
    document.insertBefore(new Comment("cool"), new HRElement());
  }, null, 'insert before not existing child');
}
