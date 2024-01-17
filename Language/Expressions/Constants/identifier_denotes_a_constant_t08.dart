// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • An identifier that denotes a constant variable is a potentially constant
///   and constant expression.
///
/// @description Checks that a constant of type `void` can be created but cannot
/// be used as an expression
/// @author sgrekhov22@gmail.com

main() {
  const void c = 1;

  print(c);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
