/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * If this is empty or has more than one element throws a StateError.
 * @description Checks that a StateError is thrown if this is empty or has more
 * than one element.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s.single.then(
    (value) {
      Expect.fail("nonexpected: $value");
    },
    onError: (error) {
      Expect.isTrue(error is StateError);
      asyncEnd();
    }
  );
}

main() {
  check(new Stream.fromIterable([]));
  check(new Stream.fromIterable([1, 2]));
  check(new Stream.fromIterable(new Iterable.generate(0, (int index) => null)));
  check(new Stream.fromIterable(new Iterable.generate(2, (int index) => null)));
}
