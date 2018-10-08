/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future done
 * The done Future completes with the same values as close, except for the
 * following case:
 * The synchronous methods of EventSink were called, resulting in an error.
 * If there is no active future (like from an addStream call), the done future
 * will complete with that error
 * @description Checks that done completes with the same value as close().
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
  var sync = new Sync2((x,y) {
    Expect.identical(x,y);
    asyncEnd();
  });

  sink.done.then((x) {
    sync.put1(x);
  });

  sink.close().then((x) {
    sync.put2(x);
  });
}
