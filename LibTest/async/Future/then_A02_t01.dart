/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 *    If the invoked callback throws, the returned future is completed with the
 * thrown error and a stack trace for the error. In the case of onError, if the
 * exception thrown is identical to the error argument to onError, the throw is
 * considered a rethrow, and the original stack trace is used instead.
 * @description Checks that if the invoked callback throws an exception,
 * the returned future f is completed with the thrown error.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Error error = new Error();
  Completer completer = new Completer();
  asyncStart();
  completer.future.then(
      (_) {
        throw error;
      }
  ).then(
      (_) {
        Expect.fail("Returned future should complete with error");
      },
      onError: (e) {
        Expect.identical(error, e);
        asyncEnd();
      }
  );

  completer.complete("go");
}
