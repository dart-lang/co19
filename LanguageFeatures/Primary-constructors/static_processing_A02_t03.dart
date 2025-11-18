// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is a compile-time error if an extension type has
/// a primary constructor whose name is also the name of a constructor declared
/// in the body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

extension type ET1(int v) {
  ET1(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(final int v) {
  ET2.new(this.v);
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3.someName(int v) {
  ET3.someName(this.v);
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4._() {
  ET4._(int v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5(final int v) {
  ET5.someName(int v) : this(v);
  factory ET5(int v) = ET5.someName;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6.someName(int v) {
  ET6(this.v);
  factory ET6.someName(int v) => ET6(v);
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}


main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
}
