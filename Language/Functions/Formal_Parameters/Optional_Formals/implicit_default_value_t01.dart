/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no default is explicitly specified for an optional parameter,
 * an implicit default of null is provided.
 * @description Checks that an implicit default value of null is provided
 * if default value is not specified explicitly.
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 */
import "../../../../Utils/expect.dart";

f([var x, var y]) {
  Expect.equals(null, x);
  Expect.equals(null, y);
}

f2({var x, var y}) {
  Expect.equals(null, x);
  Expect.equals(null, y);
}

main() {
  f();
  f(null);

  f2();
  f2(y: null);
  f2(x: null);
}
