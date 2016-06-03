/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> stream
 * The stream that this controller is controlling.
 * @description Checks the property value is of type Stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  Stream stream = controller.stream;
  Expect.isTrue(stream is Stream);
}
