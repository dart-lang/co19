/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * If an error event occurs before the value is found, the future completes
 * with this error.
 * @description Checks that if an error event occurs before the value is found,
 * the future will end with this error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void checkError(Stream s, int index, var expected) {
  asyncStart();
  s.elementAt(index).then((actual) {
      Expect.fail("unexpected onValue call");
    },
    onError: (error) {
      var message = (error as ArgumentError).message;
      Expect.equals(index, message);
      asyncEnd();
    }
  );
}

main() {
  for (int k = 0; k < 10; k++) {
    Iterable it = new Iterable.generate(10,
     (int index) => index == k ? throw new ArgumentError(index) : k
    );
    checkError(new Stream.fromIterable(it), k, k);
  }
}

