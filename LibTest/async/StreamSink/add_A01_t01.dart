/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(T event)
 * Create a data event.
 * @description Checks that data events are added as expected.
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
  c.close();
}
