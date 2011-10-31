/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that if type T is a subtype of T1 and T2 where T1 <: S<G1> and T2 <: S<G2> then
 * T is a subtype of S<G1> as well as S<G2> and every other supertype of S.
 * @author iefremov
 */


interface I<T> {}

interface I1 extends I<int> {}

interface I2 extends I<double> {}

class C implements I1, I2 {}

main() {
  Expect.isTrue(new C() is I<int>);
  Expect.isTrue(new C() is I<double>);
  Expect.isTrue(new C() is I<num>);
  Expect.isTrue(new C() is I<Object>);
  Expect.isTrue(new C() is I);
}
