/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Rectangle getBoundingClientRect()
 * Returns the smallest bounding rectangle that encompasses this element's
 * padding, scrollbar, and border.
 * @description Checks that padding, scrollbar and border are included in
 * the rectangle.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var html = '<div>Text</div>';
  var x1 = new Element.html(html);
  document.body.append(x1);
  var r1 = x1.getBoundingClientRect();

  var x2 = new Element.html(html);
  x2.style.padding = '10px';
  document.body.append(x2);
  var r2 = x2.getBoundingClientRect();
  Expect.isTrue(r2.height > r1.height, 'padding');

  var x3 = new Element.html(html);
  x3.style.padding = '10px';
  x3.style.overflow = 'scroll';
  document.body.append(x3);
  var r3 = x3.getBoundingClientRect();
  Expect.isTrue(r3.height > r2.height, 'padding scrollbar');

  var x4 = new Element.html(html);
  x4.style.padding = '10px';
  x4.style.overflow = 'scroll';
  x4.style.border = '10px solid';
  document.body.append(x4);
  var r4 = x4.getBoundingClientRect();
  Expect.isTrue(r4.height > r3.height, 'padding scrollbar border');
}
