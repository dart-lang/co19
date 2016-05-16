/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * If all elements satisfy test the resulting iterable is empty
 * @description Checks that if all elements satisfy test the resulting iterable
 * is empty
 * @author sgrekhov@unipro.ru
 */
library skipWhile_A05_t01;
import "../../../Utils/expect.dart"	;

void check(Iterable a0, bool test0(var element)) {
  var a = a0.skipWhile(test0);
  Expect.isTrue(a.isEmpty);
}

test(Iterable create([Iterable content])) {
  Iterable a0 = create([1, 3, 7, 4, 5, 6]);
  check(a0, (var element) => true);
}
