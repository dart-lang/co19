/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future catchError(Function onError, {bool test(Object error)})
 * The test function should not throw, but if it does, it is handled as if
 * the onError function had thrown.
 * @description Checks that if [test] function throws an error, then returned
 * future is completed with this error.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  new Future.error("!")
    .catchError(
      (Object error) {
        Expect.fail("The onError should not be executed, if test throws");
      },
      test:(Object error){
        Expect.equals("!", error);
        throw "@";
      }
    )
    .then(
      (Object value) {
        Expect.fail("returned future should complete with error");
      },
      onError: (Object error){
        Expect.equals("@", error);
        asyncEnd();
      }
    );
}
