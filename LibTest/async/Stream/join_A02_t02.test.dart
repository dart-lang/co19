/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Any error in the stream causes the future to complete with that error.
 * Otherwise it completes with the collected string when the "done" event
 * arrives.
 * @description Checks that future completes with correct value when stream
 * done event arrives.
 * @author ilya
 */
library join_A02_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data)) {
  Stream s = create([1, 2, 3]).asBroadcastStream();

  asyncStart();
  s.join().then((x) {
    Expect.equals('123', x);
    asyncEnd();
  });

  asyncStart();
  s.listen(
    (_) {},
    onDone:() {
      asyncEnd();
    }
  );
}
