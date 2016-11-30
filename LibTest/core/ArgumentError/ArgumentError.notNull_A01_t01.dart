/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ArgumentError.notNull([String name])
 * Create an argument error for a null argument that must not be null.
 * @description Checks that this constructor executes without error for various
 * strings and null.
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";
 
void check(var name) {
  ArgumentError err = new ArgumentError.notNull(name);
  Expect.equals(name, err.name);
  Expect.equals("Must not be null", err.message);
}

main() {
  check(null);
  check("");
  check("foo");
  check("You are not paid to think!");
}
