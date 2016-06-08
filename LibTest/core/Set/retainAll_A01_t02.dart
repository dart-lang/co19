/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void removeAll(Iterable<Object> elements)
 * Removes each element of elements from this set.
 * @description Passes a list containing null as argument to removeAll(),
 * expects no errors.
 * @author sgrekhov@unipro.ru
 */
library retainAll_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set set = create();
  set.retainAll([null].toSet());
  Expect.equals(0, set.length);
  set.retainAll([1, 2, null].toSet());
  Expect.equals(0, set.length);

  set.addAll([1, 2, 3, 4]);
  set.retainAll([null].toSet());
  Expect.equals(0, set.length);
  set.add(null);
  set.retainAll([null].toSet());
  Expect.equals(1, set.length);
}

main() {
  test(create);
}
