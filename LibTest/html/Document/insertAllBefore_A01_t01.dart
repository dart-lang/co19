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
  var x = [new Comment("cool1"), new Comment("cool2"), new Comment("cool3")];
  document.insertAllBefore(x, document.firstChild);
  Expect.equals(document.firstChild, x[0], 'insert before existing child');

  Expect.throws(() {
    document.insertAllBefore([new Comment("cool")], new HRElement());
  }, null, 'insert before not existing child');
}
