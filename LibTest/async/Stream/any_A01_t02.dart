/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that Future completes when the first matching element
 * is encounterd.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  asyncStart();
  new Stream.fromIterable(new Iterable.generate(100, (_) => ++count))
    .any((x) => x % 10 == 0)
    .then((x) {
      Expect.isTrue(x);
      Expect.equals(10, count);
      asyncEnd();
    });
}

