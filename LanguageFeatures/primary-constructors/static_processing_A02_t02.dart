// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, enum, or extension type declaration `D` with a
/// declaring header constructor, also known as a primary constructor (note that
/// it cannot be a `<mixinApplicationClass>`, because that kind of declaration
/// does not support declaring constructors, that is a syntax error).
///
/// @description Check that it is a compile-time error to declare a mixin class
/// with a primary constructor.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

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

abstract mixin class M5 {
  this();
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract base mixin class M6 {
  this.someName(var int v);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

base mixin M7.someName() {
//            ^^^^^^^^
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
}
