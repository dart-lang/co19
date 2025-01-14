// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for an initializing formal parameter
/// to occur in a redirecting or external constructor.
///
/// @description Checks that it is a compile-time error when the initializing
/// formal parameter occurs in an external constructor.
/// @author sgrekhov22@gmail.com
/// @issue 54485

class C {
  int x;

  external C([this.x = 0]);
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  a(1);
//^
// [cfe] unspecified

  final int x;
  external const E([this.x = 0]);
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
