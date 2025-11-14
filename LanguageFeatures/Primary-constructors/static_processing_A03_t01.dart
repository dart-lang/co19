// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors).
///
/// @description Check that it is a compile-time error to declare a mixin with a
/// declaring constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

mixin M1() {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin const M3(final int v);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M4(var int v) {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
}
