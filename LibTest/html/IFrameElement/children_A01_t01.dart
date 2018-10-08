/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<Element> children
 * List of the direct children of this element.
 * @description Checks expected children
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  Expect.equals(0, x.children.length);

  x.append(new DivElement());
  x.append(new ParagraphElement());

  Expect.equals(2, x.children.length);
  Expect.isTrue(x.childNodes[0] is DivElement);
  Expect.isTrue(x.childNodes[1] is ParagraphElement);
}
