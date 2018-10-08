/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T current
 * The current value of the stream.
 *
 * Is null before the first call to moveNext and after a call to moveNext
 * completes with a false result or an error.
 *
 * When a moveNext call completes with true, the current field holds the most
 * recent event of the stream, and it stays like that until the next call to
 * moveNext. Between a call to moveNext and when its returned future completes,
 * the value is unspecified.
 *
 * @description Checks that the property returns the current value of the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

void check(expected) {
  StreamController controller = new StreamController();
  StreamIterator streamIterator = new StreamIterator(controller.stream);
  asyncStart();
  controller.add(expected);
  streamIterator.moveNext().then((bool value) {
    Expect.isTrue(value);
    Expect.equals(expected, streamIterator.current);
    asyncEnd();
  });
  controller.close();
}

main() {
  check(null);
  check(12345);
  check("expected");
  check(["expected"]);
}
