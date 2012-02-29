/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be a function, let p1 , ... , pn be the positional parameters of f and let
 * pn+1, ... , pn+k be the named parameters declared by f.
 * An evaluated actual argument list o1 , ... , om+l derived from an actual argument
 * list of the form (a1, ... , am, q1 : am+1, ... ,ql : am+l) is bound to the formal
 * parameters of f as follows:
 * If m < n, or m > n + k, a run-time error occurs. Furthermore, each
 * qi, 1 <= i <= l, must be a member of the set {pm+1, ... , pm+k} or a run time error
 * occurs. Then pi is bound to oi, i from 1 to m, and qj is bound to om+j,  j from 1 to l.
 * All remaining formal parameters of f are bound to their default values.
 * @description Checks that all formal parameters that are not in the actual argument list
 * are bound to their default values.
 * @author msyabro
 * @reviewer rodionov
 */

func(p1, p2, [p3 = 1, p4 = 2, p5 = 3, p6 = 4]) {
  Expect.equals(2, p4);
  Expect.equals(3, p5);
  Expect.equals(4, p6);
}

main() {
  func(1, 2, 3);
}
