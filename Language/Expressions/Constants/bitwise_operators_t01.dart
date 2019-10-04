/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant expression is an expression whose value can never
 * change, and that can be evaluated entirely at compile time.
 * A constant expression is one of the following:
 * . . .
 * • An expression of one of the forms ~e, e1 ^ e2, e1 & e2, e1 | e2, e1 >> e2
 *   or e1 << e2, where e1 and e2 are constant expressions that evaluate to an
 *   integer value or to null.
 * @description Checks that various expressions of the specified forms can be
 * used within the initializer list of a constant constructor and are,
 * therefore, constant expressions.
 * @author iefremov
 */
// SharedOptions=--enable-experiment=triple-shift

class C {
  final a, b, c, d, e, f, g, h;

  const C() :
    a = ~1,
    b = 1 ^ 0xFF,
    c = 0xCAFE & 0xBABE,
    d = 0xDEAD | 0xBEEF,
    e = 1 >> 100,
    f = 100 << 1,
    g = ~(((1 + 2) ~/ 2) & (100500 >> 2))  | (~1 ^ (1 << 2)),
    h = 12345 >>> 123;
}

main() {
  try {
    const C();
  } catch (ok) {} // NPEs and whatnot
}
