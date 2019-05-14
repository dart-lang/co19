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
 * type id<T1, . . . , Tl> in a location where [id] denotes [D]. It is a
 * compile-time error if [l] != [s].
 * @description Checks that compile error is thrown if parametrized type number
 * is incorrect for [typedef] which defines class.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A<T> {}
class B<T1, T2> {}
class C<T1, T2, T3> {}

typedef AAlias<T> = A<T>;
typedef BAlias<T1, T2> = B<T1, T2>;
typedef CAlias<T1, T2, T3> = C<T1, T2, T3>;

main() {
  AAlias                                a1;
  AAlias<int>                           a2;
  AAlias<dynamic, dynamic>              a3; //# 01: compile-time error
  AAlias<int, dynamic, String>          a4; //# 02: compile-time error
  AAlias<int, dynamic, String, dynamic> a5; //# 03: compile-time error

  BAlias                                b1;
  BAlias<int>                           b2; //# 04: compile-time error
  BAlias<dynamic, dynamic>              b3;
  BAlias<int, dynamic, String>          b4; //# 05: compile-time error
  BAlias<int, dynamic, String, dynamic> b5; //# 06: compile-time error

  CAlias                                c1;
  CAlias<int>                           c2; //# 07: compile-time error
  CAlias<dynamic, dynamic>              c3; //# 08: compile-time error
  CAlias<int, dynamic, String>          c4;
  CAlias<int, dynamic, String, dynamic> c5; //# 09: compile-time error
}
