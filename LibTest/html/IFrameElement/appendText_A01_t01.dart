/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void appendText(String text)
 * Adds the specified text after the last child of this element.
 * @description Checks expected nodes after appendText
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.appendText('text');
  Expect.isTrue(x.firstChild is Text, 'text node');
  Expect.equals('text', x.text, 'text contents');

  x = new IFrameElement();
  x.append(new Element.html('<span><div><div></span>'));
  x.appendText('text');

  Expect.isTrue(x.firstChild is SpanElement, 'first is span');
  Expect.isTrue(x.lastChild is Text, 'last is text');
}
