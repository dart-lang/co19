/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a parameterized type S< U1, ..., Um>, let R = S.
 * If T is not a parameterized type, let R = T. Furthermore, if e is of the
 * form new T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) then let q be the
 * constructor T.id, otherwise let q be the constructor T.
 *   If R is a generic with l = m type parameters then
 *   • T is not a parameterized type, then for i ∈ 1..l, let Vi = dynamic.
 *   • If T is a parameterized type then let Vi = Ui for i ∈ 1..m.
 * If R is a generic with l != m type parameters then for i ∈ 1..l, let
 * Vi = dynamic. In any other case, let Vi = Ui for i ∈ 1..m.
 * Evaluation of e proceeds as follows:
 * . . .
 * In checked mode, if T or any of its superclasses is malbounded a dynamic
 * error occurs.
 * @description  Checks that it is a compile error in checked mode if a
 * type argument of a class in a new expression is not a subtype of its bound.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class C<T extends num> {
  C() {}
}

main() {
  new C<bool>();
}
