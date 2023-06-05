// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an inline class constructor
/// includes a superinitializer
///
/// @description Checks that a compile-time error occurs if an inline class
/// constructor includes a superinitializer
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 {
  final int id;
  V1(this.id);
  V1.x(this.id);
}

inline class V2 implements V1 {
  final int id = 0;
  V2() : super();
//       ^^^^^
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
