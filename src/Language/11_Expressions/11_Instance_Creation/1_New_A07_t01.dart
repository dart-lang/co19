/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a parameterized type S < U1, ... ,Um >, let R = S. It is a
 * compile-time error if S is not a generic type with m type parameters. If T is
 * not a parameterized type, let R = T. Furthermore, if e is of the form new
 * T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) then let q be the constructor
 * T.id, otherwise let q be the constructor T. Finally, if R is generic but T is
 * not a parameterized type, then for i from 1 to m, let Vi = dynamic, otherwise let
 * Vi = Ui.
 * Evaluation of e proceeds as follows:
 *  ...
 *  if q is a generative or redirecting constructor, then:
 *   Let Ti be the type parameters of R (if any) and let Bi be the bound of
 *   Ti, 1 <= i <= m. It is a dynamic type error if, in checked mode, Vi is not a subtype
 *   of [V1, ..., Vm /T1, ..., Tm]Bi, i ∈ 1..m.
 * @description  Checks that it is a dynamic type error in checked mode if a type argument 
 * of a class in a new expression is not a subtype of its bound.
 * @author msyabro
 * @reviewer rodionov
 */

import "../../../Utils/dynamic_check.dart";

class C<T extends num> {
  C() {}
}

main() {
  checkTypeError( () {
    new C<bool>(); /// static type warning - incompatible type arguments, see "Instance creation"
  });

  checkTypeError( () {
    new C<String>(); /// static type warning - incompatible type arguments, see "Instance creation"
  });
}
