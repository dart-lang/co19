/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A final variable is a variable whose declaration includes the modifier final. 
 * A final variable can only be assigned once, when it is initialized, or a compile-time error occurs.
 * It is a compile-time error if a variable v is a final top-level variable or a
 * final local variable and v is not initialized at its point of declaration.
 * @description Checks that a final variable is assigned at declaration.
 * @author vasya
 * @reviewer msyabro
 */

final int i = -100;
final bool b = false;
final String s = "string";

main() {
  final double pi = Math.PI;
  final List l = const [0,1,2,3];
  final Map m = const {'a': 1, 'b': 2};
  final String e = "OneTwo";

  Expect.identical(-100, i);
  Expect.identical(false, b);
  Expect.identical("string", s);
  Expect.identical(Math.PI, pi);
  Expect.identical(const [0,1,2,3], l);
  Expect.identical(const {'a': 1, 'b': 2}, m);
  Expect.identical("OneTwo", e);
}
