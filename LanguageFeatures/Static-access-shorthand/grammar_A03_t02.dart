// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We also add . to the tokens that an expression statement cannot
/// start with. This doesn't affect starting with a double literal like `.42`,
/// since that's a different token than a single `.`.
///
/// @description Checks that it is a compile-time error if an expression
/// statement is started with `.`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

void foo() {}

class C {}

enum E {e0;}

main() {
  .new;
//^
// [analyzer] unspecified
// [cfe] unspecified

  .new();
//^
// [analyzer] unspecified
// [cfe] unspecified

  .C();
//^
// [analyzer] unspecified
// [cfe] unspecified

  .foo();
//^
// [analyzer] unspecified
// [cfe] unspecified

  .e0;
//^
// [analyzer] unspecified
// [cfe] unspecified
}
