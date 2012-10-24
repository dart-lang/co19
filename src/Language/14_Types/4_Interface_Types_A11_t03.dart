/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that if type T1 is a subtype of T2<G1> where G1 is a type parameter then
 * T1 is a subtype of T2<G2> where G2 :> G1.
 * @author iefremov
 * @reviewer rodionov
 */


abstract class I<T> {}

class C implements I<int> {}

main() {
  Expect.isTrue(new C() is I);
  Expect.isTrue(new C() is I<num>);
  Expect.isTrue(new C() is I<Object>);
}
