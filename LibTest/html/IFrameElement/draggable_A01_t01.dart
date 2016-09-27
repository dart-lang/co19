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
  var x = new Element.html('<iframe></iframe>');
  Expect.isFalse(x.draggable, 'default');

  x = new Element.html('<iframe draggable="false"></iframe>');
  Expect.isFalse(x.draggable, 'explicit false');

  x = new Element.html('<iframe draggable="true"></iframe>');
  Expect.isTrue(x.draggable, 'explicit true');
}
