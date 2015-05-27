/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object asyncError)})
 * If the invoked callback returns a Future f2 then f and f2 are chained.
 * That is, f is completed with the completion value of f2.
 * @description Checks that if returned future is this future, f completes with
 * this future's value.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  
  asyncStart();

  f.then((x) => f).then((x) {
    Expect.equals(1, x);
    asyncEnd();
  });
  
  completer.complete(1);
}
