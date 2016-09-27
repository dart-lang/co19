/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String className
 * Gets/sets the class of the element.
 * @description Checks expected attribute settings
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div class="foo"></div>');
  Expect.equals('foo', x.className);

  x.className = 'bar';
  Expect.equals('bar', x.attributes['class']);
}
