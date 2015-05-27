/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasChildNodes()
 * Returns true if this node has any children.
 * @description Checks expected values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div></div>');

  Expect.isFalse(x.hasChildNodes(), 'no children');

  x = new Element.html('<div><p></p><p></p></div>');
  Expect.isTrue(x.hasChildNodes(), 'two child');

  x.nodes.removeAt(0);
  Expect.isTrue(x.hasChildNodes(), 'one child');

  x.nodes.removeAt(0);
  Expect.isFalse(x.hasChildNodes(), 'all removed');
}
