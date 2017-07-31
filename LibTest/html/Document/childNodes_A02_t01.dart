/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List<Node> childNodes
 * A list of this node's children.
 * @description Checks that childNodes is not modifiable.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var d = document;
  var ch = document.childNodes;
  Expect.throws(() => d.childNodes.add(new Text('text')));
}
