// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Primary constructors is a conciseness feature. It does not
/// provide any new semantics at all. It just allows us to express something
/// which is already possible in Dart, using a less verbose notation.
///
/// @description Check that it is a compile-time error if a primary constructor
/// of a mixin class is not a trivial.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

mixin class C1(var int v);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C2(final int _);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C3([var int v = 0]);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C4({final int v = 0});
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C5(int v);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C6(int _);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C7([int v = 0]);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class C8({int v = 0});
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
}
