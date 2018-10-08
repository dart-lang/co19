/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool cancelable
 * A boolean indicating whether the event is cancelable.
 * @description Checks expected attribute values.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new Event('click').cancelable);
  Expect.isFalse(new Event('load', cancelable: false).cancelable);
}
