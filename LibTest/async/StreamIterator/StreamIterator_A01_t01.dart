/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamIterator(Stream<T> stream)
 * Create a StreamIterator on stream.
 * @description Checks that instance of StreamIterator is created.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  StreamIterator streamIterator = new StreamIterator(controller.stream);
  Expect.isTrue(streamIterator is StreamIterator);
}
