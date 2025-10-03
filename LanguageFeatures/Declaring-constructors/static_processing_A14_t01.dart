// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following applies to both the header and the body form of
/// declaring constructors.
///
/// The semantics of the declaring constructor is found in the following steps,
/// where `D` is the class, extension type, or enum declaration in the program
/// that includes a declaring constructor, and `D2` is the result of the
/// derivation of the semantics of `D`. The derivation step will delete elements
/// that amount to the declaring constructor; it will add a new constructor `k`;
/// and it will add zero or more instance variable declarations.
///
/// Where no processing is mentioned below, `D2` is identical to `D`. Changes
/// occur as follows:
/// ...
/// Next, `k` has the modifier `const` iff the keyword `const` occurs just
/// before the name of `D` or before `this`, or if `D` is an enum declaration.
///
/// @description Check that the declaring constructor is a constant constructor
/// if the keyword `const` occurs  just before the name of `D` or before `this`.
/// For an enum declaration the constructor is constant even without the
/// modifier `const`.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

class const C1(final int v);

class C2 {
  const this(final int v);
}

extension type const ET1(int v);

extension type ET2 {
  const this(final int v);
}

enum const E1(final int v) {
  e0(1);
}

enum E2 {
  e0(2);
  const this(final int v);
}

enum E3(final int v) {
  e0(3);
}

enum E4 {
  e0(4);
  this(final int v);
}

main() {
  Expect.equals(1, const C1(1).v);
  Expect.equals(2, const C1(2).v);
  Expect.equals(1, const ET1(1).v);
  Expect.equals(2, const ET2(2).v);
  const c1 = E1.e0;
  const c2 = E2.e0;
  const c3 = E3.e0;
  const c4 = E4.e0;
  Expect.equals(1, c1.v);
  Expect.equals(2, c2.v);
  Expect.equals(3, c3.v);
  Expect.equals(4, c4.v);
}
