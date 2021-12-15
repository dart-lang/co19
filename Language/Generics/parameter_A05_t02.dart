// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///    typeParameter ::= metadata identifier (extends typeNotVoid)?
///    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
/// ...
/// Type parameters are declared in the type parameter scope of a class or
/// function. ... The type parameters of a generic class declaration [G] are also
/// in scope in the [extends] and [implements] clauses of [G] (if these exist)
/// and in the body of [G].
/// @description Checks that class type parameter is in the scope of its
/// [implements] clause.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C<X> {}

class D<X extends A> implements C<X> {}

main() {
  Expect.isTrue(D() is C);
  checkType(checkIs<C>, true, D());
  Expect.isTrue(D() is C<A>);
  checkType(checkIs<C<A>>, true, D());
  Expect.isFalse(D() is C<B>);
  checkType(checkIs<C<B>>, false, D());

  Expect.isTrue(D<A>() is C);
  checkType(checkIs<C>, true, D<A>());
  Expect.isTrue(D<A>() is C<A>);
  checkType(checkIs<C<A>>, true, D<A>());
  Expect.isFalse(D<A>() is C<B>);
  checkType(checkIs<C<B>>, false, D<A>());

  Expect.isTrue(D<B>() is C);
  checkType(checkIs<C>, true, D<B>());
  Expect.isTrue(D<B>() is C<A>);
  checkType(checkIs<C<A>>, true, D<B>());
  Expect.isTrue(D<B>() is C<B>);
  checkType(checkIs<C<B>>, true, D<B>());
}
