/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEmpty
 * Returns true if there is no element in the collection.
 * @description Checks that this method works as specified on simple sets.
 * @author pagolubev
 */
library isEmpty_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  Expect.isTrue(s.isEmpty);

  int n = 20;
  for(int i = 17; i < 17 + n; i++) {
    s.add(i);
    Expect.isTrue(!s.isEmpty);
  }

  s.clear();
  Expect.isTrue(s.isEmpty);
}

main() {
  test(create);
}
