/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(T value)
 * Removes [value] from the set. Returns true if [value] was in the set.
 * Returns false otherwise. The method has no effect if [value] value was not in
 * the set.
 * @description Checks that remove() works as specified in various simple
 * scenarios.
 * @author pagolubev
 */
library remove_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  Expect.isTrue(!s.remove(0));
  Expect.isTrue(s.length == 0);

  List a = [-7, 5, 3, -22, 6, -1];
  s.addAll(a);

  Expect.isTrue(!s.remove(0));
  Expect.isTrue(s.length == a.length);
  Expect.isTrue(s.containsAll(a));

  Expect.isTrue(s.remove(5));
  Expect.isTrue(s.length == 5);
  Expect.isTrue(s.containsAll([-7, 3, -22, 6, -1]));
  Expect.isTrue(!s.contains(5));

  Expect.isTrue(!s.remove(5)); // remove the same value again
  Expect.isTrue(s.length == 5);
  Expect.isTrue(s.containsAll([-7, 3, -22, 6, -1]));
  Expect.isTrue(!s.contains(5));
}

main() {
  test(create);
}
