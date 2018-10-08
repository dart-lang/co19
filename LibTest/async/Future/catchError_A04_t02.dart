/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 *    If test is omitted, it defaults to a function that always returns true.
 * @description Checks that [onError] is called with error and stack trace
 * if [test] is omitted and the returned future completes with value returned
 * by [onError] call
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  Error error = new Error();
  StackTrace stackTrace = StackTrace.current;
  new Future.error(error, stackTrace)
    .catchError(
      (Object e, StackTrace st) {
        Expect.equals(error, e);
        Expect.equals(stackTrace, st);
        return "@";
      }
    )
    .then(
      (Object value){
        Expect.equals("@", value);
        asyncEnd();
      }
    );
}
