/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that fold is called for each element of this Iterable
 * @author sgrekhov@unipro.ru
 */
library fold_A01_t02;
import "../../../Utils/expect.dart";

num combine(num previousValue, element) => ++previousValue;

check(Iterable a) {
  num actual = a.fold(0, combine);
  Expect.equals(a.length, actual);
}

test(Iterable create([Iterable content])) {
  check(create([]));
  check(create([1]));
  check(create([0, 0, 0]));
  check(create([1, 2, 3, 4, 5, 6, 7, 8]));
}
