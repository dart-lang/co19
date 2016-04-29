/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a String and concatenates the strings.
 *
 * Iterates through elements of this iterable, converts each one to a String by
 * calling Object.toString, and then concatenates the strings, with the
 * separator string interleaved between the elements.
 * @description Checks that join() Iterates through elements of this iterable,
 * converts each one to a String by calling Object.toString, and then
 * concatenates the strings
 * @author sgrekhov@unipro.ru
 */
library join_A01_t01;

import "../../../Utils/expect.dart";

check(Iterable a) {
  Iterator i = a.iterator;
  String expected = "";
  while (i.moveNext()) {
    expected += i.current.toString();
  }
  Expect.equals(expected, a.join());
}

test(Iterable create([Iterable content])) {
  check(create([]));
  check(create([null]));
  check(create([1, 2, 3, null, 10, 5]));
}
