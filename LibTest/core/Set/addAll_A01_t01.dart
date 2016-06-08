/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void addAll(Iterable<E> elements)
 * Adds all of elements to this Set.
 * @description Adds some integers to the set and checks that all of the unique
 * ones are actually added.
 * @author pagolubev
 */
library addAll_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  s.addAll([]);
  Expect.isTrue(s.length == 0);

  List<int> a = [1, 3, 3, 3, 7, -7, 3, 3, 9];
  s.addAll(a);
  Expect.isTrue(s.length == 5);
  for(int i = 0; i < a.length; i++) {
    Expect.isTrue(s.contains(a[i]));
  }
}

main() {
  test(create);
}
