// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors).
///
/// @description Check that it is a compile-time error to declare a mixin class
/// with a non-trivial primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

mixin class M1() {} // Ok, this declares a "trivial" constructor

base mixin class M2;

mixin class const M3(final int v);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin M4(var int v) {}
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class M5(); // Ok, "trivial" constructor

abstract base mixin class M6.someName(final int v) {}
//                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin M7.someName(); // Constructor is "trivial" but it's not a "mixin class"
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class M8.someName() { // Constructor is "non-trivial", it has in-body initializer list
  int x;
  this: x = 0;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M6);
  print(M7);
  print(M8);
}
