/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * Removes all elements of this set that satisfy test.
 * @description Checks that all elements that satisfy the test are removed, and
 * elements that don't satisfy not
 * @author sgrekhov@unipro.ru
 */
library removeWhere_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

void check(Set source, bool test(var element)) {
  Set copy = create(source);
  copy.removeWhere(test);
  int j = 0;
  for (int i = 0; i < source.length; i++) {
    if (!test(source.elementAt(i))) {
      Expect.identical(source.elementAt(i), copy.elementAt(j));
      j++;
    }
  }
  Expect.equals(j, copy.length);
}

test(Set create([Iterable content])) {
  Set set = create([1, 3, 3, 4, 5, 6]);
  check(set, (var element) => true);
  check(set, (var element) => false);
  check(set, (var element) => element > 4);
  check(set, (var element)=> element < 4);
  check(set, (var element)=> element == 4);
}

main() {
  test(create);
}
