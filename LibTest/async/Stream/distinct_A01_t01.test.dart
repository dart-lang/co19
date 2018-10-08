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
 * @description Checks that if parameter is omitted, returned stream does not
 * contain consecutive equal elements in terms of operator ==.
 * @author kaigorodov
 */
library distinct_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s) {
  Stream<T> d = s.distinct();
  bool first = true;
  T previous;
  asyncStart();
  d.listen(
    (T event) {
      Expect.isTrue(first || !(previous == event));
      first = false;
      previous = event;
    },
    onDone:() {
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]));
  check(create([1, 2, 2, 3]));
  check(create([1, 2, null, null]));
  check(create(new Iterable.generate(5, (int index) => 1)));
  check(create(new Iterable.generate(10, (int index) => [0])));
}
