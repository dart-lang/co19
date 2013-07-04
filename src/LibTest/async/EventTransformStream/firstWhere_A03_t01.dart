/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> firstWhere(bool test(T element), {Object defaultValue()})
 * If an error occurs, or if this stream ends without finding a match and with no defaultValue function
 * provided, the future will receive an error.
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
  Future f=ets.firstWhere((v){throw expectedError;});
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
