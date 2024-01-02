// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for an initializing formal parameter
/// to occur in a redirecting or external constructor.
///
/// @description Checks that it is a compile-time error when the initializing
/// formal parameter occurs in a redirecting constructor.
/// @author sgrekhov22@gmail.com

class C {
  int? x;

  C(this.x);
  C.n(this.x) : this(0);
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  a(1);

  final int x;
  const E(this.x);
  const E.n(this.x) : this(1);
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
