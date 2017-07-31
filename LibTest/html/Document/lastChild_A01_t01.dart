/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Node lastChild
 * The last child of this node.
 * @description Checks the content of lastChild.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var ch = document.childNodes;
  Expect.equals(ch[ch.length - 1], document.lastChild);
}
