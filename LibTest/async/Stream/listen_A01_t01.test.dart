/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * Adds a subscription to this stream.
 * On each data event from this stream, the subscriber's onData handler is
 * called.
 * @description Checks that on each data event from this stream,
 * the subscriber's onData handler is called.
 * @author kaigorodov
 */
library listen_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, Iterable<T> expectedData) {
  List<T> sink = new List();
  asyncStart();
  s.listen(
    (T event) {
      sink.add(event);
    },
    onDone: () {
      Expect.listEquals(expectedData, sink);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), []);
  check(create([1, 2, 3, 4]), [1, 2, 3, 4]);
  check(create([null, "2", -3, 4.0, []]), [null, "2", -3, 4.0, []]);
}
