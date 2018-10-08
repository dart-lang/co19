/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void clear()
 * Removes all elements of the collection.
 * @description Checks that clear() indeed removes all elements from the set.
 * @author pagolubev
 */
library clear_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  s.clear();
  Expect.isTrue(s.length == 0);

  s.add(1);
  s.clear();
  Expect.isTrue(s.length == 0);

  s.addAll([1, -1, 3]);
  s.clear();
  Expect.isTrue(s.length == 0);
}

main() {
  test(create);
}
