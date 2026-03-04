// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There are no other constant expressions.
///
/// @description Checks that a closure cannot be used in a constant expression.
/// @author sgrekhov22@gmail.com

const one = () {};
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  const C();
//^^^^^
// [analyzer] unspecified
  final v = () {};
//^^^^^
// [cfe] unspecified
}

enum E {
  e0;
  final v = () {};
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(one);
  print(C);
  print(E);
}
