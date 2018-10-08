/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void appendHtml(String text)
 * Parses the specified text as HTML and adds the resulting node after the
 * last child of this element.
 * @description Checks that new node will be added after the
 * last child of this element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const myButton = "myButton";

main() {
  IFrameElement x = new IFrameElement();
  x.appendHtml('<span><div></div><button class="$myButton></button></span>',
      treeSanitizer: NodeTreeSanitizer.trusted);
  dynamic ch = x.lastChild;
  print("lastChild=ch.runtimeType:$ch");

  List<Node> z = ch.getElementsByClassName(myButton);

  var y = z[0].parent;
  print("z=$z y=$y");
  Expect.equals(y, z);
}
