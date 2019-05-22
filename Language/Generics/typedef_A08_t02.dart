/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *   m typedef id<X1 extends B1, . . . , Xs extends Bs> = T;
 *   m typedef S? id<X1 extends B1, . . . , Xs extends Bs>(
 *     T1 p1, . . . , Tn pn, [Tn+1 pn+1, . . . , Tn+k pn+k]);
 *   m typedef S? id<X1 extends B1, . . . , Xs extends Bs>(
 *     T1 p1, . . . , Tn pn, {Tn+1 pn+1, . . . , Tn+k pn+k});
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
 * [dynamic]. The associated type of [D], call it [F], is, respectively:
 *   T
 *   S0 Function(T1, . . . , Tn, [Tn+1, . . . , Tn+k])
 *   S0 Function(T1, . . . , Tn, {Tn+1 xn+1, . . . , Tn+k xn+k})
 * ...
 * Moreover, let [T1], . . . , [Tl] be types and let [U] be the parameterized
 * type id<T1, . . . , Tl> in a location where [id] denotes [D]. ... It is a
 * compile-time error if [U] is not well-bounded
 * @description Checks that compile error is thrown if [U] is not well-bounded.
 * @Issue 36959
 * @author iarkh@unipro.ru
 */

class A<X extends A<X>> {}

typedef AAlias<T extends A<T>> = T Function<T>();

main() {
  AAlias             a1;
  AAlias<A>          a2;
  AAlias<A<Null>>    a3;
  AAlias<A<dynamic>> a4;
  AAlias<A<Object>>  a5;
  AAlias<A<int>>     a6; //# 01: compile-time error
  AAlias<int>        a7; //# 02: compile-time error
  AAlias<dynamic>    a8;
}
