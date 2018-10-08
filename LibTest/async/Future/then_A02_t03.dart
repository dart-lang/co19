/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 *    If the invoked callback throws, the returned future is completed with the
 * thrown error and a stack trace for the error. In the case of onError, if the
 * exception thrown is identical to the error argument to onError, the throw is
 * considered a rethrow, and the original stack trace is used instead.
 * @description Checks that if the invoked onError throws an exception,
 * which is identical to to the error argument to onError, then the throw is
 * considered a rethrow, and the original stack trace is used instead.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  Error error = new Error();
  StackTrace stackTrace = StackTrace.current;
  new Future.error(error, stackTrace).then(
      (_) {
        Expect.fail("Initial future should complete with error");
      },
      onError: (_) {
        throw error;
      }
  ).then(
      (_) {
        Expect.fail("Returned future should complete with error");
      },
      onError: (e, st) {
        Expect.identical(error, e);
        Expect.identical(stackTrace, st);
        asyncEnd();
      }
  );
}
