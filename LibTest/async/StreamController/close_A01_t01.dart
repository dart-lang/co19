/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future close()
 * Close the StreamSink. It'll return the done Future.
 * @description Checks that returned value is a Future.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new StreamController().close() is Future);
}
