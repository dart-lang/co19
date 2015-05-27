/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Element> children
 * List of the direct children of this element.
 * @description Checks that change to children is reflected in the element
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div><span>text</span><span></span></div>');
  x.children.removeAt(0);
  x.children[0].text = 'foo';
  x.children.add(new Element.html('<span>bar</span>'));

  Expect.equals('<div><span>foo</span><span>bar</span></div>', x.outerHtml);
}
