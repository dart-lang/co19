/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node insertAllBefore(Iterable<Node> newNodes, Node refChild)
 * Inserts all of the nodes into this node directly before refChild.
 * @description Checks expected dom after insert
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  //-------------------
  IFrameElement iframe = new Element.html('<iframe>Content</iframe>');
  var ref = iframe.childNodes[0];

  iframe.insertAllBefore([], ref);
  Expect.equals(
      '<iframe>Content</iframe>', iframe.outerHtml, 'insert empty list');

  //-------------------
  iframe = new Element.html('<iframe>Content</iframe>');
  ref = iframe.childNodes[0];
  iframe.insertAllBefore([new HRElement(), new AnchorElement()], ref);

  Expect.equals('<iframe><hr><a></a>Content</iframe>', iframe.outerHtml,
      'insert before existing child');

  //-------------------
  iframe = new Element.html('<iframe></iframe>');
  ref = new PreElement(); // not a child

  Expect.throws(() {
    iframe.insertAllBefore([new HRElement(), new AnchorElement()], ref);
  }, null, 'insert before not existing child');
}
