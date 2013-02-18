/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(onError(AsyncError asyncError), {bool test(Object error)})
 * When this completes with an error, test is called with the error's value.
 * If the invocation returns true, onError is called with the error wrapped in an AsyncError.
 * The result of onError is handled exactly the same as for then's onError.
 * If test returns false, the exception is not handled by onError, but is thrown unmodified,
 * thus forwarding it to f.
 * If test is omitted, it defaults to a function that always returns true.
 * @description Checks that if test returns false, an exception that passed into onError is
 * the exception that the future f gets.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Completer completer = new Completer();
  Future f0 = completer.future;
  Object err1=1;
  Object err2=2;

  Future f=f0.catchError(
    (AsyncError asyncError) {},
    test: (Object error){err1=error; return false;}
  );
  f.catchError((AsyncError asyncError) {
    err2=asyncError.error;
  });

  completer.completeError(3);

  new Future.delayed(0, (){
    Expect.equals(err1, err2);
  });
}
