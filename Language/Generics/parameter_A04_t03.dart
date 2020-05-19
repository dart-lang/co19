/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *    typeParameter ::= metadata identifier (extends typeNotVoid)?
 *    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * ...
 * Type parameters are declared in the type parameter scope of a class or
 * function. The type parameters of a generic [G] are in scope in the bounds of
 * all of the type parameters of [G].
 * @description Checks that non-function typedef type parameter is in the type
 * parameter scope.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

import "../../Utils/expect.dart";

class A {}
class B extends A {}

class C<X, Y> {
  check(exp1, exp2) {
    Expect.equals(exp1, X);
    Expect.equals(exp2, Y);
  }
}

typedef Alias<X extends A, Y extends X> = C<X, Y>;

main() {
  Alias().check(A, A);
  Alias<A, A>().check(A, A);
  Alias<A, B>().check(A, B);
  Alias<B, B>().check(B, B);
}
