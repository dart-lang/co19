/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * If this stream reports an error, the Future will report that error.
 * @description Checks that the future reports the instance of the error object
 * which was reported by the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(var expectedError) {
  Completer completer = new Completer();
  Stream s=new Stream.fromFuture(completer.future);
  Future<bool> f2=s.every((v)=>true);
  asyncStart();
  f2.then(
    (data) {
      Expect.fail("data passed: $data");
    },
    onError: (error) {
      Expect.identical(expectedError, error);
      asyncEnd();
    }
  );
  completer.completeError(expectedError);
}

main() {
  check(new ArgumentError(1));
  check(new StateError(""));
}
