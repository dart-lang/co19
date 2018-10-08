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
 * @description Checks that it is a compile time error if the actual argument
 * list contains a named argument whose name is not among those specified in
 * the function declaration.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

func(p1, p2, {p3}) {}

main() {
  func(1, 2, p: 3);
}
