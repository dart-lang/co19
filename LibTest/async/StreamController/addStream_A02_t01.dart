/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<T> source, {bool cancelOnError: true})
 * Events must not be added directly to this controller using add, addError,
 * close or addStream, until the returned future is complete.
 *
 * @description Checks that events can not be added until the returned future is
 * complete.
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

  Expect.throws(() => c.add(0));
  Expect.throws(() => c.addError(0));
  Expect.throws(() => c.addStream(s));
  Expect.throws(() => c.close());
}
