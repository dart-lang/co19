/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 *    If test is omitted, it defaults to a function that always returns true.
 * @description Checks that [onError] is called if [test] is omitted and the
 * returned future completes with value returned by [onError] call
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f = completer.future;

  f.catchError(
    (Object error) {
      Expect.equals("!", error);
      return "@";
    }
  )
  .then(
    (Object value){
      Expect.equals("@", value);
      asyncEnd();
    }
  );

  asyncStart();
  completer.completeError("!");
}
