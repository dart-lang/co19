/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion set children(List<Element> value)
 * @description Checks that this property is assignable
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  Expect.equals(0, x.children.length);

  x.children = [new DivElement(), new ParagraphElement()];
  Expect.equals(2, x.children.length);
  Expect.isTrue(x.children[0] is DivElement);
  Expect.isTrue(x.children[1] is ParagraphElement);
}
