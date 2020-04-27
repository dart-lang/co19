/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [G] be a generic class or parameterized type alias with formal
 * type parameter declarations [F1] .. [Fk] containing formal type parameters
 * [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
 * [Xj] has a simple bound when one of the following requirements is satisfied:
 * [Bj] is omitted.
 * [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that simple bounds are correct for non-function type
 * aliases with list and map parameters: [A<X extends List>], [B<X extends Map>]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

import "../../../../Utils/expect.dart";

class C<X> {}

typedef A<X extends List> = C<X>;
typedef B<X extends Map> = C<X>;

testA() {
  A? source;
  var fsource = toF(source);

  F<A<List>?>? target1 = fsource;
  F<A<List<dynamic>>?>? target2 = fsource;

  F<A<List<dynamic>?>?>? target0 = fsource;
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<List<int>>?>? target3 = fsource;
//                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<A<List<Null>>?>? target4 = fsource;
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A();
}

testB() {
  B? source;
  var fsource = toF(source);
  F<B<Map>?>? target1 = fsource;
  F<B<Map<dynamic, dynamic>>?>? target2 = fsource;

  F<B<Map<int, dynamic>>?>? target3 = fsource;
//                                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<dynamic, int>>?>? target4 = fsource;
//                                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<int, Null>>?>? target5 = fsource;
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<Null, int>>?>?  target6 = fsource;
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<int, int>>?>? target7 = fsource;
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<B<Map<Null, Null>>?>? target8 = fsource;
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  B();
}

main() {
  testA();
  testB();
}