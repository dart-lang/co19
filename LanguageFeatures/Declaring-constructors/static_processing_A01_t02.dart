// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, enum, or extension type
/// has a primary constructor whose name is also the name of a constructor
/// declared in the body.
///
/// @description Check that it is a compile-time error if an extension type has
/// a primary constructor whose name is also the name of a constructor declared
/// in the body.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

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
  ET3.someName();
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

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
