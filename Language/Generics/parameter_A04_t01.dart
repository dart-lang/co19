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
 * @description Checks that class type parameter is in the type parameter
 * scope.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}

class C<X extends A, Y extends X> {
  check(exp1, exp2) {
    Expect.equals(exp1, X);
    Expect.equals(exp2, Y);
  }
}

main() {
  C().check(A, A);
  C<A, A>().check(A, A);
  C<A, B>().check(A, B);
  C<B, B>().check(B, B);
}
