// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors).
///
/// @description Check that it is a syntax error to declare a mixin application
/// class with a primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

mixin M {}

class C1() = Object with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2.someName() = Object with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class const C3.someName(final int v) = Object with M;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

class C4.new(var int v) = Object with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C5._() = Object with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
}
