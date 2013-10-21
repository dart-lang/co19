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
 * @description Checks that an error in a stream causes the future to complete
 * with that error.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var error = new Error();
  var iter = [1,2,3,4,5];

  var s = new Stream.fromIterable(iter).map((event) {
    if (event==3)
      throw error;
    else
      return event;
  });

  asyncStart();

  s.join().then((_) {
    Expect.fail('unexpected onValue event');
  }).catchError((e) {
    Expect.identical(error, e);
    asyncEnd();
  });
}

