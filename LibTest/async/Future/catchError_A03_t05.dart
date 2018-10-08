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
 * @description Checks that if [test] returns true, then [onError] is called with
 * the error and stack trace and the returned future is completed with
 * the result of this call.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List log = [];
  asyncStart();
  StackTrace stackTrace = StackTrace.current;
  new Future.error("!", stackTrace)
    .catchError(
      (Object e, StackTrace st) {
        log.add(2);
        log.add(e);
        log.add(st);
        return "ok";
      },
      test:(Object e) {
        log.add(1);
        log.add(e);
        return true;
      }
    ).then(
      (value) {
        Expect.listEquals([1, "!", 2, "!", stackTrace], log);
        Expect.equals("ok", value);
        asyncEnd();
      }
    );
}
