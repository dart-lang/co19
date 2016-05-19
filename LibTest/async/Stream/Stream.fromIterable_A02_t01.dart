/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromIterable(Iterable<T> data)
 * If iterating data throws an error, the stream ends immediately with that
 * error. No done event will be sent (iteration is not complete), but no
 * further data events will be generated either, since iteration cannot
 * continue.
 * @description Checks that if iterating throws an error, onError callback
 * is run with this error. Also checks that data events are neither further
 * generated nor fired and onDone event does not happen.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

f(i) {
  if (i < 5)
    return i;
  if (i == 5)
    throw i;
  if (i > 5)
    Expect.fail('data generation did not stop');
}

main() {
  var it = new Iterable.generate(10, (i) => f(i));
  Stream s = new Stream.fromIterable(it);

  asyncStart();

  s.listen((x) {
    Expect.isTrue(x < 5, 'unexpected onData event');
  }, onError: (e) {
    Expect.equals(5, e);
    asyncEnd();
  }, onDone: () {
    Expect.fail('unexpected onDone event');
  });
}

