/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract Set<E> intersection(Set<Object> other)
 * Returns a new set which is the intersection between this set and other.
 * @description Checks that new set is returned and [:this:] is not changed.
 * @author msyabro
 */
library intersection_A01_t03;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Iterable content])) {
  Set s = create();
  Set newSet = s.intersection([1, 2, 3].toSet());
  Expect.setEquals(s, [].toSet());
  if(identical(newSet, s)) {
    Expect.fail("[:intersection():] has returned [:this:]");
  }

  s = create([1, 2 , 3]);
  newSet = s.intersection([1, 2, 3].toSet());
  Expect.setEquals(s, [1, 2, 3].toSet());
  if(identical(newSet, s)) {
    Expect.fail("[:intersection():] has returned [:this:]");
  }

  newSet = s.intersection([1].toSet());
  Expect.setEquals(s, [1, 2, 3].toSet());
  if(identical(newSet, s)) {
    Expect.fail("[:intersection():] has returned [:this:]");
  }
}

main() {
  test(create);
}
