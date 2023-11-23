// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issues 35114 (Analyzer does not allow
/// declare a class with typed function parameter if it's parametrized
/// contravariant or invariant) and 35115 (Dart runtime does not allow declare a
/// class with typed function parameter if it's parametrized contravariant or
/// invariant)
/// @Issue 35114, 35115
/// @author iarkh@unipro.ru


typedef G<X> = void Function(X);
class A<X extends G> {}

main() {
  G<dynamic>? g1;
  G<Never>?   g2;
  G<int>?     g3;

  A<G<dynamic>> a1;
  A<G<Never>>   a2;

  A<G<int>>? a3;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  A<G<Null>>? a4;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
