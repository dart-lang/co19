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
  var div = new Element.html('<div><span></span></div>');
  var ref = div.querySelector('span');
  div.insertAllBefore([], ref);

  Expect.equals('<div><span></span></div>', div.outerHtml, 'insert empty list');

  //-------------------
  div = new Element.html('<div><span></span></div>');
  ref = div.querySelector('span');
  div.insertAllBefore([new HRElement(), new AnchorElement()], ref);

  Expect.equals('<div><hr><a></a><span></span></div>', div.outerHtml,
      'insert before existing child');

  //-------------------
  div = new Element.html('<div><span></span></div>');
  ref = new PreElement(); // not a child

  Expect.throws(() {
    div.insertAllBefore([new HRElement(), new AnchorElement()], ref);
  }, null, 'insert before not existing child');
}
