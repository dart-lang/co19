/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if an error occurs, the future will receive that
 * error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(var expectedError) {
  Completer completer = new Completer();
  Stream s = new Stream.fromFuture(completer.future);
  Future f = s.lastWhere((v) {throw expectedError;});
  asyncStart();
  f.then(
    (data) {
      Expect.fail("data passed: $data");
    },
    onError: (error) {
      Expect.equals(expectedError, error);
      asyncEnd();
    }
  );
  completer.completeError(expectedError);
}

main() {
  check(new ArgumentError(1));
  check(new StateError(""));
}
