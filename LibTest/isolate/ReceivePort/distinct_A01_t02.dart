/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 * The returned stream provides the same events as this stream,
 * except that it never provides two consequtive data events that are equal.
 * Equality is determined by the provided equals method.
 * If that is omitted, the '==' operator on the last provided data element is used.
 * @description Checks that if parameter is present, returned stream filters events
 * according to the supplied function.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable<int> data, bool equals(var previous, var next)) {
  Stream s = IsolateStream.fromIterable(data);
  Stream d = s.distinct(equals);
  bool first = true;
  var previous;
  asyncStart();
  d.listen((var event) {
    if (first) {
      first = false;
    } else {
      Expect.isFalse(equals(previous, event), "p=$previous, e=$event");
    }
    previous = event;
  }, onDone: () {
    asyncEnd();
  });
}

int abs(x) => x < 0 ? -x : x;

int sign(x) => (x < 0) ? -1 : (x == 0 ? 0 : 1);

main() {
  check([1, 2, 2, 3], (var previous, var next) => previous == next);
  check([2, 4, 3, 1], (var previous, var next) => previous % 2 == next % 2);
  check(new Iterable.generate(10, (int index) => index),
      (var previous, var next) => abs(previous - next) <= 1);
  check(new Iterable.generate(10, (int index) => -5 + index),
      (var previous, var next) => sign(previous) == sign(next));
}
