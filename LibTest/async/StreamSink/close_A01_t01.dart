/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future close()
 * Close the StreamSink. It'll return the done Future.
 * @description Checks that close() closes a sink and returns a future that
 * will be completed when sink is closed.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();
  var sink = c.sink;
  sink.add(1);
  sink.add(2);

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals([1,2], x);
    asyncEnd();
  });

  asyncStart();
  sink.close().then((_) {
    asyncEnd();
  });
}
