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
import "../../../Utils/expect.dart";

main() {
  StreamController c = new StreamController();
  List iterable = [1, 2, 3];
  Stream s = new Stream.fromIterable(iterable);

  asyncStart();
  c.stream.toList().then((x) {
    Expect.listEquals(iterable, x);
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
