/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node parentNode
 * The parent node of this node.
 * from DOM-lelvel-3:  if a node has just been created and not yet added to the tree,
 * or if it has been removed from the tree, this is null. 
 * @description Checks expected parentNode values
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new Element.html('<iframe class="y">Content Text</iframe>');

  var body = document.body;
  body.append(x);
  Expect.equals(body, x.parentNode);

  body.children.remove(x);
  Expect.equals(null, x.parentNode);
}
