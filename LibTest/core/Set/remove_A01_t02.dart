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
 * @description Passes null argument to remove(), expects no errors.
 * @author pagolubev
 */
library remove_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  Expect.isFalse(s.remove(null));
  s.addAll([1, 2]);
  Expect.isFalse(s.remove(null));
}

main() {
  test(create);
}
