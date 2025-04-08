// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a constant constructor is declared
/// by a class C if any instance variable declared in C is initialized with an
/// expression that is not a constant expression
/// @description Checks that compile error is produced if class declares a
/// constant constructor and has instance variable which is initialised by static
/// non-constant expression.
/// @author sgrekhov@unipro.ru

class C {
  static final y = 1;

  final x = y;
//          ^
// [cfe] unspecified

  const C();
//^^^^^
// [analyzer] unspecified
}

main() {
  const C();
}
