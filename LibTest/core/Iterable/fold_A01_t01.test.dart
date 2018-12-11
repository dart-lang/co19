/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * T fold <T>(T initialValue, T combine(T previousValue, E element))
 * Reduces a collection to a single value by iteratively combining each element
 * of the collection with an existing value
 * Uses initialValue as the initial value, then iterates through the elements
 * and updates the value with each element using the combine function, as if by:
 *
 *  var value = initialValue;
 *  for (E element in this) {
 *      value = combine(value, element);
 *  }
 *  return value;
 *  Example of calculating the sum of an iterable:
 *  iterable.fold(0, (prev, element) => prev + element);
 * @description Checks that the result is correct for simple functions.
 * @author kaigorodov
 */
library fold_A01_t01;
import "dart:math";
import "../../../Utils/expect.dart";

check(Iterable a, num init, combine, num expected) {
  num actual = a.fold(init, combine);
  Expect.equals(expected, actual);
}

test(Iterable create([Iterable content])) {
  check(create([1, 2, -3]), 0, (num value, element) => value + element, 0);
  check(create([1, 2, -3]), 1, (num value, element) => value * element, -6);
  check(create([0, 2, -3]), 1, (num value, element) => value * element, 0);
  check(create([1, 2, -5, -6]), -1000,
      (num value, element) => max(value, element as int), 2);
}
