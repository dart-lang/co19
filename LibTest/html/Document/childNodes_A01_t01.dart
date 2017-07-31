/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<Node> childNodes
 * A list of this node's children.
 * @description Checks the content of childNodes.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  List<Node> ch = document.childNodes;
  Expect.equals(2, ch.length);
  Expect.isTrue(
      ch[1] is HtmlHtmlElement, "${ch[1].runtimeType}!=HtmlHtmlElement");
}
