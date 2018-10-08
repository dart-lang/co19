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
  var x = new Element.html('<iframe>IFrameElement Content</iframe>');
  document.body.append(x);

  Expect.isTrue(x.hasChildNodes(), 'one child 1');

  x.nodes.removeAt(0);
  Expect.isFalse(x.hasChildNodes(), 'no children');

  x.append(new Comment("foo"));
  x.append(new Comment("bar"));
  Expect.isTrue(x.hasChildNodes(), 'two children');

  x.nodes.removeAt(0);
  Expect.isTrue(x.hasChildNodes(), 'one child 2');

  x.nodes.removeAt(0);
  Expect.isFalse(x.hasChildNodes(), 'all removed');
}
