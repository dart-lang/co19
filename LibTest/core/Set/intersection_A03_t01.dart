/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract Set<E> intersection(Set<Object> other)
 * @description Checks that null elements don't cause any errors.
 * @author msyabro
 */
library intersection_A03_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Iterable content])) {
  Expect.equals(0, create([1, 2, 3, 4]).intersection([null].toSet()).length);
  Expect.equals(1, create([1, 2, 3, 4]).intersection([null, 1].toSet()).length);
}
main() {
  test(create);
}
