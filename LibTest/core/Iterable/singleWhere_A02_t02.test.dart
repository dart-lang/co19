/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * If no or more than one element match then a StateError is thrown.
 * @description Checks that a StateError is thrown if more than one element
 * matched.
 * @author kaigorodov
 */
library singleWhere_A02_t02;
import "../../../Utils/expect.dart";

check(Iterable a, bool f(value)) {
  Expect.throws(() {a.singleWhere(f);}, (e) => e is StateError);
}

test(Iterable create([Iterable content]), {bool isSet: false}) {
  if (!isSet) {
    check(create(const[1, 2, -5, -6, 1]), (value) => value == 1);
    check(create([1, 2, -3, 4, -1]), (value) => value < 0);
  }
}
