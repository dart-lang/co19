/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<T> source, {bool cancelOnError: true})
 * Receives events from source and puts them into this controller's stream.
 *
 * Returns a future which completes when the source stream is done.
 *
 * Data and error events are forwarded to this controller's stream. A done
 * event on the source will end the addStream operation and complete the
 * returned future.
 *
 * @description Checks that data events from source are added correctly and
 * that returned future completes when the source ends.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();
  var iter = [1, 2, 3];
  var s = new Stream.fromIterable(iter);

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals(iter, x);
    asyncEnd();
  });

  asyncStart();
  c.addStream(s).then((_) {
    c.close();
    asyncEnd();
  });
}
