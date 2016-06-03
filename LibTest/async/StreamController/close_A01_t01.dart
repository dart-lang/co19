/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Tells the stream sink that no further streams will be added.
 *
 * Returns a future which is completed when the stream sink has shut down.
 *
 * @description Checks that returned value is a Future.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new StreamController().close() is Future);
}
