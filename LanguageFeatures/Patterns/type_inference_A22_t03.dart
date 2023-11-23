// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Cast:
///
/// Resolve the type name to a type X. It is a compile-time error if the name
/// does not refer to a type.
///
/// Type-check the subpattern using X as the matched value type.
///
/// @description Check that it is a compile-time error if type-check of the
/// subpattern using `X` as the matched value type fails in an irrefutable
/// context
/// @author sgrekhov22@gmail.com

Never foo() => throw 0;

class A {}
class B extends A {}
class C extends B {}

main() {
  final (int x as String) = "42";
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (int y as String) = 42;
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final (int z as String ) = foo();
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
