/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if an error occurs, the future will receive that error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(var expectedError) {
  Completer completer = new Completer();
  Stream s=new Stream.fromFuture(completer.future);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  Future f=ets.lastWhere((v){throw expectedError;});
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
