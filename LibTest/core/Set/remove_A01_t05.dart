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
 * @description Checks correctness of the set after rehashing (triggered by
 * remove()).
 * @author msyabro
 */
library remove_A01_t05;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  for(int i = 0; i < 1000; i++) {
    s.add(i);
  }

  for(int i = 0; i < 1000; i++) {
    s.remove(i);
    Expect.isFalse(s.contains(i));
  }
}

main() {
  test(create);
}
