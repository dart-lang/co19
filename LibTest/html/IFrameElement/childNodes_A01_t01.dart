/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<Node> childNodes
 * A list of this node's children.
 * @description Checks expected children.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  Expect.equals(0, x.childNodes.length);

  x.append(new DivElement());
  x.append(new Text("text"));
  x.append(new ParagraphElement());
  x.append(new Comment());

  Expect.equals(4, x.childNodes.length);
  Expect.isTrue(x.childNodes[0] is DivElement);
  Expect.isTrue(x.childNodes[1] is Text);
  Expect.isTrue(x.childNodes[2] is ParagraphElement);
  Expect.isTrue(x.childNodes[3] is Comment);
}
