/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node insertBefore(Node newChild, Node refChild)
 * Inserts node into this node directly before refChild.
 * MDN: If referenceElement is null, newElement is inserted at the end of the
 * list of child nodes.
 * @description Checks expected dom after insert
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement iframe = new Element.html('<iframe>Content</iframe>');

  iframe.insertBefore(new HRElement(), null);
  Expect.equals(
      '<iframe>Content<hr></iframe>', iframe.outerHtml, 'insert before null');
}
