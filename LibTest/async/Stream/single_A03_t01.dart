/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * If an error event occurs before or after the first data event, the resulting
 * future is completed with that error.
 * @description Checks that an error event occurs before the first data event,
 * the resulting future is completed with that error.
 * @author ngl@unipro.ru
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
    onError: (e) {
      Expect.equals(error, e);
      asyncEnd();
    }
  );
}
Error error = new Error();

main() {
  check(new Stream.fromFuture(new Future.sync(() => throw error)));
  check(new Stream.fromFuture(new Future(() => throw error)));

  Completer c = new Completer();
  Future f = c.future;
  c.completeError(error);

  check(new Stream.fromFuture(f));

}
