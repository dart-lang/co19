/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String dir
 * Gets/sets the directionality of the element.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<p dir="ltr"></p>');
  Expect.equals('ltr', x.dir);

  x = new Element.html('<p dir="rtl"></p>');
  Expect.equals('rtl', x.dir);
}
