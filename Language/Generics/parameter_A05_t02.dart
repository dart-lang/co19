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
 * [implements] clause.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C<X> {}

class D<X extends A> implements C<X> {}

main() {
  Expect.isTrue(D() is C);
  Expect.isTrue(D() is C<A>);
  Expect.isFalse(D() is C<B>);

  Expect.isTrue(D<A>() is C);
  Expect.isTrue(D<A>() is C<A>);
  Expect.isFalse(D<A>() is C<B>);

  Expect.isTrue(D<B>() is C);
  Expect.isTrue(D<B>() is C<A>);
  Expect.isTrue(D<B>() is C<B>);
}
