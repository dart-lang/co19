/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final style
 * @description Checks that CSS properties can be set via style.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div>First div</div>');
  document.body.append(x);
  var leftX = x.documentOffset.x;

  var y = new Element.html('<div>Second div</div>');
  y.style.margin = '10px';
  document.body.append(y);
  var leftY = y.documentOffset.x;

  Expect.isTrue(leftX < leftY);
}
