// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an inline class constructor
/// declares a super parameter
///
/// @description Checks that a compile-time error occurs if an inline class
/// constructor declares a super parameter
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V1 {
  final int id;
  V1(this.id, [Object? _]);
}

inline class V2 implements V1 {
  final int id;
  V2(this.id, super.id);
//            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  V2.n(super.id);
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  V2(42, 0);
}
