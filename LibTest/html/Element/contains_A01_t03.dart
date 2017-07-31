/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Node other)
 * Returns true if this node contains the specified node.
 * @description Checks that node does not contain previous children after
 * setting of innerHtml.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x =
      new Element.html('<div><pre><button></button></pre><span></span></div>');

  var pre = x.querySelector('pre');
  var button = x.querySelector('button');
  var span = x.querySelector('span');

  x.innerHtml = 'override';

  Expect.isFalse(x.contains(pre), 'pre');
  Expect.isFalse(x.contains(button), 'button');
  Expect.isFalse(x.contains(span), 'span');
}
