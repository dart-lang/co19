/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 * If the callback returns a Future, the future returned by then will be
 * completed with the same result as the future returned by the callback.
 * @description Checks that the future returned by then completes with the same
 * result as the future returned by the callback.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  Completer completer2 = new Completer();
  Future f2 = completer2.future;

  asyncStart();
  Future f1 = f.then((fValue) {
    asyncEnd();
    return f2;
  });

  int res = null;
  Object err = null;
  Future f3 = f1.then(
    (int fValue) {res = fValue;},
    onError: (Object e) {err = e;}
   );

  runAfter(f3, (){
    Expect.equals(2, res);
    Expect.equals(null, err);
  });

  completer.complete();
  completer2.complete(2);
}
