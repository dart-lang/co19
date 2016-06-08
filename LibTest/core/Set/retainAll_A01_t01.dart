/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainAll(Iterable<Object> elements)
 * Removes all elements of this set that are not elements in [elements].
 *
 * Checks for each element of elements whether there is an element in this set
 * that is equal to it (according to this.contains), and if so, the equal
 * element in this set is retained, and elements that are not equal to any
 * element in elements are removed.
 * @description Checks that retainAll() removes all elements of this set that
 * are not elements in [elements]
 * @author sgrekhov@unipro.ru
 */
library retainAll_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set set = create();

  set.retainAll([].toSet());
  Expect.equals(0, set.length);

  set.retainAll([1, 2, 3].toSet());
  Expect.equals(0, set.length);

  set.addAll([1, 2, 3, 4, 5, 6, 7]);

  set.retainAll([1, 2, 3].toSet());
  Expect.equals(3, set.length);
  Expect.isTrue(set.containsAll([1, 2, 3]));
}

main() {
  test(create);
}
