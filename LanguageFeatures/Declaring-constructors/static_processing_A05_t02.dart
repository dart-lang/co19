// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of the
/// declaring constructor is the same as the name of some constructor declared
/// in the body. Test extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

extension type ET1(int v) {
  ET1(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET3.someName(final int v) {
  const ET3.someName(this.v);
//      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4 {
  this.someName(final int v);
  ET4.someName(this.v);
//^^^^^^^^^^^^
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

extension type ET6 {
  this.someName(final int v);
  ET6(this.v);
  factory ET6.someName(int v) => ET6(v);
//        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
}
