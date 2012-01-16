/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no default is explicitly specified for an optional
 * parameter, but a default could legally be provided, an implicit default of null
 * is provided.
 * @description Checks that an implicit default value of null is provided
 * if default value is not specified explicitly.
 * @author msyabro
 * @reviewer iefremov
 */

f([var x, var y]) {
  Expect.equals(null, x);
  Expect.equals(null, y);
}

main() {
  f();
  f(null);
  f(y: null);
}
