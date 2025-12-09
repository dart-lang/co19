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
/// Next, `k2` has the modifier `const` if and only if the keyword `const`
/// occurs just before the name of `D` or `D` is an `enum` declaration. In any
/// case, such an occurrence of `const` in the header of `D` is omitted in `D2`.
///
/// @description Check that the primary constructor is a constant constructor
/// if the keyword `const` occurs  just before the name of `D`. For an enum
/// declaration the constructor is constant even without the modifier `const`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class const C(final int v);

mixin class const M();

extension type const ET(int v);

enum const E1(final int v) {
  e0(1);
}

enum E2(final int v) {
  e0(2);
}

main() {
  Expect.equals(1, const C(1).v);
  Expect.equals(1, const ET(1).v);
  const m = M();
  const c1 = E1.e0;
  const c2 = E2.e0;
  Expect.equals(1, c1.v);
  Expect.equals(2, c2.v);
}
