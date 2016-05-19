/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromIterable(Iterable<T> data)
 * Creates a single-subscription stream that gets its data from data.
 * @description Checks that created stream returns all the data from Iterable.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable<int> data) {
  Iterator<int> it = data.iterator;
  Stream s = new Stream.fromIterable(data);

  asyncStart();

  s.listen((int event) {
    Expect.isTrue(it.moveNext());
    Expect.equals(it.current, event);
  }, onError: (error) {
    Expect.fail("onError($error) called unexpectedly");
  }, onDone: () {
    Expect.isFalse(it.moveNext());
    asyncEnd();
  });
}

main() {
  check([]);
  check([1, 2, 3, null]);
  check(new Iterable.generate(10, (int index) => index * 2));
}
