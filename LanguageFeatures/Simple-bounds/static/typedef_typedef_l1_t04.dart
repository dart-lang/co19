// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let [G] be a generic class or parameterized type alias with formal
/// type parameter declarations [F1] .. [Fk] containing formal type parameters
/// [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
/// [Xj] has a simple bound when one of the following requirements is satisfied:
/// [Bj] is omitted.
/// [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
/// a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
/// generic class or parameterized type alias [G1] (that is, [T] is a raw type),
/// every type argument of [G1] has a simple bound.
/// @description Checks that simple bounds are correct for [typedef] with
/// [typedef] parameter (not used).
/// Note that G2<T1> == G2<T2> == void Function() for all types T1 and T2. So as
/// long as you have F<G2<...>> it doesn't matter what ... stands for, it's
/// always just the same type.
/// @Issue 41684, 42429
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";

typedef G1<X> = X Function();
typedef G2<X extends G1<num>> = void Function();

void testme(G2 source) {
  var fsource = toF(source);

  F<G2<G1<num>>> target = fsource;

  F<G2<G1<dynamic>>> target1 = fsource;

  F<G2<G1<Null>>> target2 = fsource;
//                          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G2<G1<num?>>> target3 = fsource;
//                          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G2<G1<Object>>> target4 = fsource;
//                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G2<G1<Never>>> target0 = fsource;
}

main() {}
