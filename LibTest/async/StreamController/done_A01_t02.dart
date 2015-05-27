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
 * will complete with that error.
 * @description Checks that if synchronous methods resulted in no errors,
 * done completes with the same value as close(). 
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();

  asyncStart();
  var sync = new Sync2((x,y) {
    Expect.identical(x,y);
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
