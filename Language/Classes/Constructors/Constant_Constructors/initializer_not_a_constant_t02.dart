// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a constant constructor is declared
/// by a class C if any instance variable declared in C is initialized with an
/// expression that is not a constant expression.
///
/// @description Checks that a compile error is produced if a class declares a
/// `const` constructor and has an instance variable initialized by a
/// non-constant expression (even if there are also instance variables
/// initialized by constant expressions).
/// @author sgrekhov@unipro.ru

class A {}

class C {
  final y = 3;
  final x = new A();
//          ^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

  const C();
//^^^^^
// [analyzer] unspecified
}

main() {
  const C();
}
