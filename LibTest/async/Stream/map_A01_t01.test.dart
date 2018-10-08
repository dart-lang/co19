/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * Creates a new stream that converts each element of this stream to a new value
 * using the convert function.
 * @description Checks that each element of this stream is processed.
 * @author kaigorodov
 */
library map_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, dynamic convert(T event), List expected) {
  AsyncExpect.data(expected, stream.map(convert));
}

void test(CreateStreamFunction create) {
  check(create([]), (_) => 1, []);
  check(create([1,2,3,4,5]), (e) => e, [1,2,3,4,5]);
  check(create([1,2,3,4,5]), (e) => -e, [-1,-2,-3,-4,-5]);
  check(create([1,2,3,4,5]), (e) => 0, [0,0,0,0,0]);
  // expand to the same stream
  check(
    create([null, "2", -3, 4.0, []]),
    (e) => e,
    [null, "2", -3, 4.0, []]
  );
}
