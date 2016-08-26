/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(T value)
 * Returns true if [value] is in the set.
 * @description Passes null as argument, expects no errors.
 * @author pagolubev
 */
library contains_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  Expect.isFalse(s.contains(null));
  s.add(null);
  Expect.isTrue(s.contains(null));
}

main() {
  test(create);
}
