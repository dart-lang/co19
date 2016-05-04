/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 * If the invoked callback throws, the returned future is completed with the
 * thrown error and a stack trace for the error. In the case of onError, if the
 * exception thrown is identical to the error argument to onError, the throw is
 * considered a rethrow, and the original stack trace is used instead.
 * @description Checks that if the invoked onError throws an exception,
 * the returned future f is completed with the error.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f0 = completer.future;
  Error err = new Error();

  completer.completeError(1);

  asyncStart();
  Future f1 = f0.then(
      (fValue) {
        asyncEnd();
        Expect.fail("Should not be here");
      },
      onError: (e, st) {
        asyncEnd();
        throw err;
      }
  );

  int res1 = null;
  var res2 = null;
  asyncStart();
  Future f2 = f1.then(
      (fValue) {
        asyncEnd();
        res1 = fValue;
      },
      onError: (e, st) {
        asyncEnd();
        res2 = e;
      }
  );

  runAfter(f2, () {
    Expect.equals(null, res1);
    Expect.equals(err, res2);
  });
}
