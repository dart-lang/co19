/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ArgumentError.value(value, [ String name, String message ])
 * Creates error containing the invalid value.
 * @description Checks that this constructor executes without error for various
 * values and name argument
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";

class C {
}

void check(var value, String name) {
  ArgumentError err = new ArgumentError.value(value, name);
  Expect.equals(value, err.invalidValue);
  Expect.equals(name, err.name);
  Expect.equals(null, err.message);
}

main() {
  check(null, "");
  check("", "name");
  check("foo", "bar");
  check(true, "some name");
  check(5, null);
  check(new C(), "123");
  check(3.14, "Pi");
}
