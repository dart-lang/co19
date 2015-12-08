/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a constant object expression of either the
 * form const T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k)or the form
 * const T(a1, .., an, xn+1: an+1, ..., xn+k: an+k) is T.
 * It is a static warning if the static type of ai, 1 <= i <= n+k may not be
 * assigned to the type of the corresponding formal parameter of the
 * constructor T.id (respectively T).
 * @description Checks that the static type of a constant object expression
 * is T.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A(p1): x = p1, y = 3;
  final x;
  final y;
}

class B {
  const B.name();
}

class C {
  const C(p1, [p2]);
}


main() {
  A a = const A(1);
  B b = const B.name();
  C c = const C(1);
}
