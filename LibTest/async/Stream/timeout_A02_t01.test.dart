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
 * from this stream, the onTimeout function is called.
 * @author ngl@unipro.ru
 * @author a.semenov@unipro.ru
 */
library timeout_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  int count = 0;
  Stream s1 = create(["a", "b", "c"]);
  Stream s2 = s1.asyncMap((x) => new Future.delayed(durationMs(100), () => x));
  Stream s3 = s2.timeout(
      durationMs(10),
      onTimeout: (EventSink sink) => sink.add(count++)
  );
  AsyncExpect.data([0, "a", 1, "b", 2, "c"], s3);
}
