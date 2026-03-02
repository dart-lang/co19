// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a constant constructor is declared
/// by a class `C` if any instance variable declared in `C` is initialized with
/// an expression that is not a constant expression.
///
/// @description Checks that a compile error is produced if a class declares a
/// `const` constructor and has an instance variable that is initialized with a
/// non-constant expression.
/// @author sgrekhov@unipro.ru

class A {}

class C {
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
