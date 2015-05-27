/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test whether Range.selectNode and Range.selectNodeContents work
 * across documents 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var otherDocument = document.implementation.createDocument(null, "doc", null);
  var elem = otherDocument.createElement("elem");
  otherDocument.documentElement.append(elem);

  var selectNodeRange = document.createRange();
  selectNodeRange.selectNode(elem);

  shouldBe(selectNodeRange.startContainer, otherDocument.documentElement);
  shouldBe(selectNodeRange.endContainer, otherDocument.documentElement);
  shouldBe(selectNodeRange.startContainer.ownerDocument, otherDocument);
  shouldBe(selectNodeRange.endContainer.ownerDocument, otherDocument);
  shouldBe(selectNodeRange.cloneContents().ownerDocument, otherDocument);

  var selectNodeContentsRange = document.createRange();
  selectNodeContentsRange.selectNodeContents(elem);

  shouldBe(selectNodeRange.startContainer, otherDocument.documentElement);
  shouldBe(selectNodeRange.endContainer, otherDocument.documentElement);
  shouldBe(selectNodeContentsRange.startContainer.ownerDocument, otherDocument);
  shouldBe(selectNodeContentsRange.endContainer.ownerDocument, otherDocument);
  shouldBe(selectNodeRange.cloneContents().ownerDocument, otherDocument);
}
