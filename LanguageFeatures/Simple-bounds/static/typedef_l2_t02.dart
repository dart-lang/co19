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
/// @description Checks that instantiate-to-bounds works correctly for [typedef
///  G<X, Y extends X> = X Function(Y)]
/// @Issue 34689, 34699, 43599
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";

typedef G<X, Y extends X> = X Function(Y);

test(G source) {
  var fsource = toF(source);

  F<G<dynamic, Never>> target = fsource;

  F<G<dynamic, Null>> target1 = fsource;
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<Never, dynamic>> target2 = fsource;
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<Null, dynamic>> target3 = fsource;
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<Null, Null>> target4 = fsource;
//                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<Never, Never>> target5 = fsource;
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<dynamic, dynamic>> target6 = fsource;
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}
