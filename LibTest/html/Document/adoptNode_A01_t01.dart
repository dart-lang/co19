/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node adoptNode(Node source)
 * Adopt node from an external document
 * from MDN: Adopts a node from an external document. The node and its subtree
 * is removed from the document it's in (if any), and its ownerDocument is changed
 * to the current document. The node can then be inserted into the current document.
 * @description Checks that the node and its subtree is removed from the document
 * and its ownerDocument is changed to the current document.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var myButton = "myButton";
  HtmlDocument d2 =
      document.implementation.createHtmlDocument("Another Document");
  var x = new Element.html('<button id="$myButton"></button>');
  d2.body.append(x);
  Expect.equals(d2, x.ownerDocument);
  Expect.equals(x, d2.getElementById(myButton));
  document.adoptNode(x);
  Expect.isNull(d2.getElementById(myButton));
  Expect.equals(document, x.ownerDocument);
}
