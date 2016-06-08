/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already
 * in the set.
 * @description Checks that a null value can be added without error.
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library add_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  s.add(null);
  Expect.equals(1, s.length);
}

main() {
  test(create);
}
