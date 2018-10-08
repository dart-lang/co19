/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future then(dynamic onValue(T value), {Function onError})
 *    If the callback returns a Future, the future returned by then will be
 * completed with the same result as the future returned by the callback.
 * @description Checks that if returned future is this future, f completes with
 * this future's value.
 * @author ilya
 */
import "dart:async";
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
