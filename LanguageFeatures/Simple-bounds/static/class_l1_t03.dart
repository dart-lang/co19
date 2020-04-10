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
 * @description Checks that simple bounds are correct for [A<X extends
 * List<int>>], [B<X extends Map<int, int>>
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

typedef F<X> = void Function<Y extends X>();
F<X> toF<X>(X x) => null;

class A<X extends List<int>> {}
class B<X extends Map<int, int>> {}

testA() {
  A source;
  var fsource = toF(source);
  F<A<List<int>>> target = fsource;

  F<A<List<dynamic>>> target1 = fsource;  //# 01: compile-time error
  F<A<List<Null>>>    target2 = fsource;  //# 02: compile-time error
  F<A<List<String>>>  target3 = fsource;  //# 03: compile-time error

  A();
}

testB() {
  B source;
  var fsource = toF(source);
  F<B<Map<int, int>>> target = fsource;

  F<B<Map<dynamic, int>>> target1     = fsource;  //# 04: compile-time error
  F<B<Map<int, dynamic>>> target2     = fsource;  //# 05: compile-time error
  F<B<Map<Null, int>>> target3        = fsource;  //# 06: compile-time error
  F<B<Map<int, Null>>> target4        = fsource;  //# 07: compile-time error
  F<B<Map<dynamic, dynamic>>> target5 = fsource;  //# 08: compile-time error
  F<B<Map<Null, Null>>> target6       = fsource;  //# 09: compile-time error
  F<B<Map<String, int>>> target7      = fsource;  //# 10: compile-time error
  F<B<Map<int, String>>> target8      = fsource;  //# 11: compile-time error

  B();
}

main() {
  testA();
  testB();
}