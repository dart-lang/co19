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
 * Whenever more than timeLimit passes between two events from this stream, the
 * onTimeout function is called.
 *
 * @description Check that if onTimeout is omitted, then [timeout] will just
 * put a TimeoutException into the error channel of the returned stream.
 * Original stream contains errors.
 * @author a.semenov@unipro.ru
 */
library timeout_A03_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List expectedEvents) {
  int count = 0;
  // delay for 100 ms and throw error if element starts with '!'
  Stream s2 = s.asyncMap(
                          (x) => new Future.delayed(
                              durationMs(100),
                              () {
                                if (x is String && x.startsWith("!")){
                                  throw x;
                                }
                                return x;
                              }
                          )
  );
  Stream s3 = s2.timeout(durationMs(10));
  List actualEvents = [];
  asyncStart();
  s3.listen(
    (event) {
      actualEvents.add(event);
    },
    onError: (error) {
      if (error is TimeoutException){
        actualEvents.add("+TE"+count.toString());
        count++;
      } else {
        actualEvents.add("+" + error.toString());
      }
    },
    onDone: () {
      Expect.listEquals(expectedEvents, actualEvents);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create(["!a", "!b", "!c"]), ["+TE0", "+!a", "+TE1", "+!b", "+TE2", "+!c"]);
  check(create(["!a", "b", "!c"]), ["+TE0", "+!a", "+TE1", "b", "+TE2", "+!c"]);
  check(create(["a", "b", "!c"]), ["+TE0", "a", "+TE1", "b", "+TE2", "+!c"]);
  check(create(["a", "!b", "c"]), ["+TE0", "a", "+TE1", "+!b", "+TE2", "c"]);
}
