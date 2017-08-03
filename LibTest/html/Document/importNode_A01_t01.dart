/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node importNode(Node importedNode, [bool deep])
 * Returns a clone of a node from an external document.
 * from MDN: The new node's parentNode is null, since it has not yet been
 * inserted into the document tree.
 * @description Checks that parentNode is null after importNode(Comment).
 * Checks that importedNode is not removed from the document.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  var myButton = "myButton";
  HtmlDocument d2 =
      document.implementation.createHtmlDocument("Another Document");
  var x = new Element.html('<button id="$myButton"></button>');
  d2.body.append(x);
  Expect.equals(d2, x.ownerDocument, "x.ownerDocument");
  Expect.equals(x, d2.getElementById(myButton), "d2.getElementById 1");
  var x2 = document.importNode(x);
  Expect.isNull(x2.parentNode);
  Expect.equals(x, d2.getElementById(myButton), "d2.getElementById 2");
  Expect.equals(document, x2.ownerDocument, "x2.ownerDocument");
}
