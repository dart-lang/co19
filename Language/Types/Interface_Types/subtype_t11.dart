/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one
 * of the following conditions is met:
 *  • T is S.
 *  • T is ⊥
 *  • S is dynamic.
 *  • S is a direct supertype of T.
 *  • T is a type parameter and S is the upper bound of T.
 *  • T is a type parameter and S is Object.
 *  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
 *    and Ti << Si 1 <= i <= n.
 *  • T and S are both function types, and T << S under the rules of section
 *    (Types/Function Types).
 *  • T is a function type and S is Function.
 *  • T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff
 * [⊥/Dynamic]T << S.
 * . . .
 * An interface type T may be assigned to a type S, written T <=> S, if either
 * T <: S or S <: T.
 * @description Checks the assignability (both ways) of variables and values
 * that meet the described requirements. This is a test of static checker, as
 * it's a type error in checked mode when variable is assigned a value whose
 * runtime type is a supertype of the variable's actual type.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */


class I {}
I makeI() {} // returns null to avoid type error in checked mode

class A implements I {}
A makeA() {}

class B extends A {}

class C {}
Object makeObject() {}

main() {
  Object o = new C();
  C c = makeObject();

  I i = new A();
  A a1 = makeI();

  A a2 = new B();
  B b = makeA();
}
