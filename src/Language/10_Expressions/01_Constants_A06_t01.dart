/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A reference to a static final variable or to a final top-level variable(5) is a constant expression.
 * @description Checks that a reference to a top-level final variable can be assigned to a static final variable
 * and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 */

final x = "x";
final y = x;

class C {
  static final z = x;
}

main() {
  Expect.equals("x", C.z);
  Expect.equals("x", y);
}
