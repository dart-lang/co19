/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one of the following conditions is met:
 * T is S.
 * T is ⊥
 * S is Dynamic.
 * S is a direct supertype of T.
 * T is a type variable and S is the upper bound of T.
 * T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn> and Ti << Si 1 <= i <= n.
 * T << U and U << S.
 * T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that generic class C<A> is not assignable to C<B> where C - generic, A and B are unrelated classes
 * as such assignment doesn't meet any of these conditions.
 * @static-type-error
 * @author iefremov
 * @reviewer rodionov
 */

class A {
  A() {}
}

class B {
  B() {}
}

class C<T> {
  C() {}
}

main() {
  C<A> c = new C<B>();
}