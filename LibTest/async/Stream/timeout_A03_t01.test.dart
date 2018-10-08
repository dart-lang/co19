/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * Creates a new stream with the same events as this stream.
 *
 * If onTimeout is omitted, a timeout will just put a TimeoutException into the
 * error channel of the returned stream.
 *
 * @description Check that if onTimeout is omitted, then [timeout] will just
 * put a TimeoutException into the error channel of the returned stream.
 * @author ngl@unipro.ru
 */
library timeout_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  int count = 0;
  Stream s1 = create(["a", "b", "c"]);
  Stream s2 = s1.asyncMap((x) => new Future.delayed(durationMs(100), () => x));
  Stream s3 = s2.timeout(durationMs(10));
  List actual = [];
  asyncStart();
  s3.listen(
      (event) {
        actual.add(event);
      },
      onError: (error) {
        Expect.isTrue(error is TimeoutException);
        actual.add(count++);
      },
      onDone: () {
        Expect.listEquals([0, "a", 1, "b", 2, "c"], actual);
        asyncEnd();
      }
  );
}
