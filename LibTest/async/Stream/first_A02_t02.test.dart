/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * If this stream is empty (a done event occurs before the first data event),
 * the resulting future completes with a StateError.
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 * @description Checks that for non-empty stream, this.first is equivalent to
 * this.elementAt(0).
 * @author kaigorodov
 */
library first_A02_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s = s.asBroadcastStream();
  Future.wait(
    [s.elementAt(0), s.first]
  ).then(
    (List result) {
      Expect.equals(result[0], result[1]);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([123]));
  check(create([1, 2, 3]));
  check(create(["a", 2, 3.14]));
}
