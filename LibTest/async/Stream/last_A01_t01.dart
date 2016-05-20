/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * Returns the last element of the stream.
 * @description Checks that the last element is returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VAL = 123;

void check(Stream s) {
  asyncStart();
  s.last.then((value) {
    Expect.equals(VAL, value);
    asyncEnd();
  });
}

main() {
  check(new Stream.fromFuture(new Future.sync(() => VAL)));
  check(new Stream.fromFuture(new Future(() => VAL)));

  // using completable future
  Completer completer = new Completer();
  check(new Stream.fromFuture(completer.future));
  completer.complete(VAL);

  // using fromIterable
  check(new Stream.fromIterable([VAL]));
  check(new Stream.fromIterable([VAL/2, VAL]));
  check(new Stream.fromIterable(new Iterable.generate(1, (int index) => VAL)));
  check(new Stream.fromIterable(new Iterable.generate(2,
      (int index) => VAL*index)));
}

