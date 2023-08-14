// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type constructor
/// includes a superinitializer.
///
/// @description Checks that a compile-time error occurs if an extension type
/// constructor includes a superinitializer
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int id) {
  V1.new([this.id = 0]);
  V1.x(this.id);
}

extension type V2(int id) implements V1 {
  V2.new(this.id) : super();
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2.x(int i) : super.x(i);
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  V1(42);
  V2();
}
