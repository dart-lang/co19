/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future done
 * Return a future which is completed when the StreamSink is finished.
 *
 * If the StreamSink fails with an error, perhaps in response to adding events
 * using add, addError or close, the done future will complete with that error.
 *
 * Otherwise, the returned future will complete when either:
 *  - all events have been processed and the sink has been closed, or
 *  - the sink has otherwise been stopped from handling more events (for
 *    example by cancelling a stream subscription).
 *
 * @description Checks that if synchronous methods resulted in no errors,
 * done completes with the same value as close().
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();

  asyncStart();
  var sync = new Sync2((x, y) {
    Expect.identical(x, y);
    asyncEnd();
  });

  c.done.then((x) {
    sync.put1(x);
  });

  c.add(1);

  c.close().then((x) {
    sync.put2(x);
  });

  c.stream.listen(null);
}
