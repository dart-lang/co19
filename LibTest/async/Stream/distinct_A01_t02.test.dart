/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> distinct([bool equals(T previous, T next)])
 *    Skips data events if they are equal to the previous data event.
 *    The returned stream provides the same events as this stream, except that it
 * never provides two consecutive data events that are equal.
 *    Equality is determined by the provided equals method. If that is omitted,
 * the '==' operator on the last provided data element is used.
 * @description Checks that if parameter is present, returned stream filters
 * events according to the supplied function.
 * @author kaigorodov
 */
library distinct_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool equals(T previous, T next)) {
  Stream<T> d = s.distinct(equals);
  bool first = true;
  T previous;
  asyncStart();
  d.listen(
    (T event) {
      Expect.isTrue(first || !equals(previous, event), "p=$previous, e=$event");
      first = false;
      previous = event;
    },
    onDone:() {
      asyncEnd();
    }
  );
}

int abs(x) => x < 0 ? -x: x;

int sign(x) => (x < 0) ? -1: (x == 0 ? 0 : 1);

void test(CreateStreamFunction create) {
  check(
      create([1, 2, 2, 3]),
      (previous, next) => previous == next
  );
  check(
      create([2,4,3,1]),
      (previous, next) => previous % 2 == next % 2
  );
  check(
      create(new Iterable.generate(10, (int index) => index)),
      (var previous, var next) => abs(previous - next) <= 1
  );
  check(
      create(new Iterable.generate(10, (int index) => -5 + index)),
      (var previous, var next) => sign(previous) == sign(next)
  );
}
