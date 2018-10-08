/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool draggable
 * Indicates whether the element can be dragged and dropped.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<p></p>');
  Expect.isFalse(x.draggable, 'default');

  x = new Element.html('<p draggable="false"></p>');
  Expect.isFalse(x.draggable, 'explicit false');

  x = new Element.html('<p draggable="true"></p>');
  Expect.isTrue(x.draggable, 'explicit true');
}
