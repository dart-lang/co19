// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s currently a compile-time error for a class to implement,
/// extend or mix-in the Enum class.
///
/// @description Check that it is a compile-time error to mixin an enum
/// @author sgrekhov22@gmail.com

abstract class M1 with Enum {}
//                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class M2 = Object with Enum;
//                              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
}
