/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Node other)
 * Returns true if this node contains the specified node.
 * @description Checks that node contains its direct and indirect children.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(
      new Element.html('<div><pre><button></button></pre><span></span></div>'));

  var pre = x.querySelector('pre');
  var button = x.querySelector('button');
  var span = x.querySelector('span');

  Expect.isTrue(x.contains(pre), 'pre');
  Expect.isTrue(x.contains(button), 'button');
  Expect.isTrue(x.contains(span), 'span');
}
