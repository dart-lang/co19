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
 * @description Checks that future completes with correct value and stream
 * done event arrives.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var iter = [1, 2, 3];
  var s = new Stream.fromIterable(iter).asBroadcastStream();

  asyncStart();
  s.join().then((x) {
    Expect.equals('123', x);
    asyncEnd();
  });

  asyncStart();
  s.listen((_) {}, onDone:() {
    asyncEnd();
  });
}

