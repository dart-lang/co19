/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node insertBefore(Node newChild, Node refChild)
 * Inserts node into this node directly before refChild.
 * @description Checks expected dom after insert
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  //-------------------
  IFrameElement iframe = new Element.html('<iframe>Content</iframe>');
  var ref = iframe.childNodes[0];

  iframe.insertBefore(new HRElement(), ref);
  Expect.equals('<iframe><hr>Content</iframe>', iframe.outerHtml,
      'insert before existing child 1');

  iframe.insertBefore(new IFrameElement(), ref);
  Expect.equals('<iframe><hr><iframe></iframe>Content</iframe>',
      iframe.outerHtml, 'insert before existing child 2');

  //-------------------
  iframe = new Element.html('<iframe><span></span></iframe>');
  ref = new PreElement(); // not a child

  Expect.throws(() {
    iframe.insertBefore(new HRElement(), ref);
  }, null, 'insert before not existing child');
}
