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
 * function. ... The type parameters of a generic class declaration [G] are also
 * in scope in the [extends] and [implements] clauses of [G] (if these exist)
 * and in the body of [G].
 * @description Checks that class type parameter is in the scope of its
 * [extends] clause.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C<X> {
  check(exp) {
    Expect.equals(exp, X);
  }
}

class D<X extends A> extends C<X> {}

main() {
  D().check(A);
  D<A>().check(A);
  D<B>().check(B);
}
