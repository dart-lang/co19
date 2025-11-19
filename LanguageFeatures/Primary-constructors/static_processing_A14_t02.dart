// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// Next, `k` has the modifier `const` iff the keyword `const` occurs just
/// before the name of `D` or before `this`, or if `D` is an enum declaration.
///
/// @description Check that the primary constructor is not a constant
/// constructor if there is no `const` keyword  just before the name of `D`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C(final int v);

mixin class M();

extension type ET(int v);

main() {
  const C(1);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const ET(1);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const M();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
