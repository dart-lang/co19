/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> timeout(Duration timeLimit, {dynamic onTimeout()})
 * Time-out the future computation after timeLimit has passed.
 * . . .
 * If onTimeout is omitted, a timeout will cause the returned future to complete
 * with a TimeoutException.
 *
 * @description Checks that if onTimeout is omitted, a timeout causes the
 * returned future to complete with a TimeoutException.
 * @author ngl@unipro.ru
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  Completer completer = new Completer();
  completer.future.timeout(
      new Duration(microseconds:1)
  ).then(
      (_) {
        Expect.fail("Returned future should complete with error");
      },
      onError: (e) {
        Expect.isTrue(e is TimeoutException);
        asyncEnd();
      }
  );
}
