/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let f be a function with h required parameters, let p1 , ... , pn be the positional parameters of f and let
 * ph+1, ... , ph+k be the named parameters declared by f.
 * An evaluated actual argument list o1 , ... , om+l derived from an actual argument
 * list of the form (a1, ... , am, q1 : am+1, ... ,ql : am+l) is bound to the formal
 * parameters of f as follows:
 * If m < h, or m > n, a NoSuchMethodError is thrown. Furthermore, each
 * qi, 1 <= i <= l, must be a member of the set {ph+1, ... , ph+k} or a NoSuchMethodError is thrown.
 * Then pi is bound to oi, i from 1 to m, and qj is bound to om+j,  j from 1 to l.
 * All remaining formal parameters of f are bound to their default values.
 * @description Checks that NoSuchMethodError is thrown if the number of actual parameters is more than
 * the number of positional arguments specified in the function declaration.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

func(p1, p2, [p3]) {}

main() {
  Expect.throws(() {
    func(1, 2, 3, 4, 5); /// static type warning - too many arguments, see "Binding actuals to formals"
  }, (e) => e is NoSuchMethodError);
}
