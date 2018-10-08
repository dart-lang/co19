/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int offsetHeight
 * The height of an element, relative to the layout.
 * @description Checks that it should be equal to the height of client
 * rectangle.  
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div>First div</div>');
  document.body.append(x);

  x = new Element.html('<div>Second div</div>');
  x.style.margin = '10px';
  x.style.border = '10px solid';
  x.style.overflow = 'scroll';
  document.body.append(x);

  var r = x.getBoundingClientRect();

  Expect.approxEquals(x.offsetHeight, r.height, 1);
}
