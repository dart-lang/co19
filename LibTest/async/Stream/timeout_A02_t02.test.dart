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
 * @description Check that if more than timeLimit passes between two events
 * (including errors) from this stream, the onTimeout function is called.
 * @author a.semenov@unipro.ru
 */
library timeout_A02_t02;
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
  Stream s3 = s2.timeout(
      durationMs(10),
      onTimeout: (EventSink sink) => sink.add(count++)
  );
  List actualEvents = [];
  asyncStart();
  s3.listen(
    (event) {
      actualEvents.add(event);
    },
    onError: (error) {
      actualEvents.add("+"+error.toString());
    },
    onDone: () {
      Expect.listEquals(expectedEvents, actualEvents);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create(["!a", "!b", "!c"]), [0, "+!a", 1, "+!b", 2, "+!c"]);
  check(create(["!a", "b", "!c"]), [0, "+!a", 1, "b", 2, "+!c"]);
  check(create(["a", "b", "!c"]), [0, "a", 1, "b", 2, "+!c"]);
  check(create(["a", "!b", "c"]), [0, "a", 1, "+!b", 2, "c"]);
}
