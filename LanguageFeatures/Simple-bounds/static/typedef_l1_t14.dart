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
/// @description Checks that simple bounds are correct for [typedef] with [X
/// extends num?] parameter (not used)
/// @Issue 41684, 42429
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";

typedef G<X extends num?> = void Function();

void testme(G source) {
  var fsource = toF(source);
  F<G<num?>> target = fsource;

  F<G<dynamic>> target1 = fsource;

  F<G<Object>> target2 = fsource;
//                       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  F<G<Null>> target3 = fsource;

  F<G<num>> target4 = fsource;

  F<G<Never>> target5 = fsource;
}

main()  {}
