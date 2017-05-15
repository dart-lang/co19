/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void appendHtml(String text)
 * Parses the specified text as HTML and adds the resulting node after the
 * last child of this element.
 * @description Checks expected nodes after appendHtml
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<span></span>');
  x.appendHtml('text', treeSanitizer: NodeTreeSanitizer.trusted);
  Expect.isTrue(x.firstChild is Text, 'append to empty children list');

  x = new Element.html('<span><div><div></span>');
  x.appendHtml('<!--comment-->text', treeSanitizer: NodeTreeSanitizer.trusted);

  Expect.isTrue(x.firstChild is DivElement, 'div');
  Expect.isTrue(x.firstChild.nextNode is Comment, 'comment');
  Expect.isTrue(x.lastChild is Text, 'text');
}
