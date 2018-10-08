/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ArgumentError.value(value, [ String name, String message ])
 * Creates error containing the invalid value.
 * @description Checks that this constructor executes without error for various
 * values
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";

class C {
}

void check(var value) {
  ArgumentError err = new ArgumentError.value(value);
  Expect.equals(value, err.invalidValue);
  Expect.equals(null, err.name);
  Expect.equals(null, err.message);
}

main() {
  check(null);
  check("");
  check("foo");
  check(true);
  check(5);
  check(new C());
  check(3.14);
}
