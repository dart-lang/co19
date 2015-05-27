/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var dt = document.implementation.createDocumentType("foo", "", "");
  var iter = new NodeIterator(dt, NodeFilter.SHOW_ALL);
  debug("NodeIterator rooted at a DocumentType node not yet associated with a document:");
  shouldBe(iter.referenceNode.ownerDocument, document);
  shouldBe(iter.nextNode(), dt);
  shouldBe(iter.nextNode(), null);
  shouldBe(iter.previousNode(), dt);
  shouldBe(iter.previousNode(), null);
  iter.detach();

  iter = new NodeIterator(dt, NodeFilter.SHOW_ALL);
  var d = document.implementation.createDocument(null, "doc", dt);
  debug("NodeIterator rooted at a DocumentType node that becomes used by a document after the iterator has been created:");
  shouldBe(iter.nextNode(), dt);
  shouldBe(iter.previousNode(), dt);
  debug("..and after removing it from the document:");
  dt.remove();
  shouldBe(iter.nextNode(), dt);
  shouldBe(iter.previousNode(), dt);
  iter.detach();
}
