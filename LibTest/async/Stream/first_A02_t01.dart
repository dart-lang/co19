/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * If this stream is empty (a done event occurs before the first data event),
 * the resulting future completes with a StateError.
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 * @description Checks that future completes with a StateError when this
 * stream is empty.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s.first.then(
    (value) {
      Expect.fail("empty stream returned $value");
    },
    onError:(error) {
      Expect.isTrue(error is StateError);
      asyncEnd();
    }
  );
}

main() {
  check(new Stream.fromIterable([]));
  check(new Stream.fromIterable(new Iterable.generate(0, (int index) => 1)));
}
