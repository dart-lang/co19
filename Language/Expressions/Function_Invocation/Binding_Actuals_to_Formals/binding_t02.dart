/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be a function with h required parameters, let p1, ..., pn
 * be the positional parameters of f and let ph+1, ..., ph+k be the named
 * parameters declared by f.
 * An evaluated actual argument list o1, ..., om+l derived from an actual
 * argument list of the form (a1, ..., am, q1: am+1, ..., ql: am+l) is bound to
 * the formal parameters of f as follows:
 * . . .
 * If l > 0, then it is necessarily the case that n = h, because a method cannot
 * have both optional positional parameters and named parameters.
 * If m < h, or m > n, a NoSuchMethodError is thrown. Furthermore, each
 * qi, 1 <= i <= l, must be a member of the set {ph+1, ..., ph+k} or a
 * NoSuchMethodError is thrown. Then pi is bound to oi, i ∈ 1..m, and qj is
 * bound to om+j, j ∈ 1 1..l.
 * All remaining formal parameters of f are bound to their default values.
 * @description Checks that actual parameters are bound correctly.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

f(p1, p2, {p3, p4: 0}) {
  Expect.equals(1, p1);
  Expect.equals(2, p2);
  Expect.equals(3, p3);
  Expect.equals(4, p4);
}

g(p1, p2, p3, p4, p5, p6) {
  Expect.equals("s", p1);
  Expect.equals("t", p2);
  Expect.equals("r", p3);
  Expect.equals("i", p4);
  Expect.equals("n", p5);
  Expect.equals("g", p6);
}

h(name1, [name2 = null, name3]) {
  Expect.equals(true, name1);
  Expect.equals(false, name2);
  Expect.equals(0, name3);
}

main() {
  f(1, 2, p4: 4, p3: 3);
  g("s", "t", "r", "i", "n", "g");
  h(true, false, 0);
}
