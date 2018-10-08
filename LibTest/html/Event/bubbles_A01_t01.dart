/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool bubbles
 * A boolean indicating whether the event bubbles up through the DOM or not.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new Event('click').bubbles);
  Expect.isFalse(new Event('load', canBubble: false).bubbles);
}
