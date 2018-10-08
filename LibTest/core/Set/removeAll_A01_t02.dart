/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void removeAll(Iterable<Object> elements)
 * Removes each element of elements from this set.
 * @description Passes a list containing null as argument to removeAll(),
 * expects no errors.
 * @author pagolubev
 */
library removeAll_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  s.removeAll([null].toSet());
  Expect.equals(0, s.length);
  s.removeAll([1, 2, null].toSet());
  Expect.equals(0, s.length);

  s.addAll([1, 2]);
  s.removeAll([null].toSet());
  Expect.equals(2, s.length);
  s.removeAll([1, 2, null].toSet());
  Expect.equals(0, s.length);
}

main() {
  test(create);
}
