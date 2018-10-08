/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 *    If this future completes with an error, then test is first called with
 * the error value.
 *    If test returns false, the exception is not handled by this catchError,
 * and the returned future completes with the same error and stack trace as
 * this future.
 *    If test returns true, onError is called with the error and possibly stack
 * trace, and the returned future is completed with the result of this call in
 * exactly the same way as for then's onError.
 * @description Checks that if [test] returns false, [onError] is not called and
 * the returned future completes with the same error
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future future = completer.future;
  List log = [];
  Object initialError = "!";

  future.catchError(
    (Object error) {
      log.add(2);
      log.add(error);
    },
    test: (Object error){
      log.add(1);
      log.add(error);
      return false;
    }
  )
  .catchError(
    (Object error) {
      Expect.listEquals([1, initialError], log);
      Expect.identical(initialError, log[1]);
      Expect.identical(initialError, error);
      asyncEnd();
    }
  );

  asyncStart();
  completer.completeError(initialError);
}
