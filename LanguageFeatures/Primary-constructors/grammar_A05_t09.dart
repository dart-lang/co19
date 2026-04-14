// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a factory constructor declaration of the form
/// `factory C(...` optionally starting with zero or more of the modifiers
/// `const`, `augment`, or `external`. Assume that `C` is the name of the
/// enclosing class, mixin class, enum, or extension type. In this situation,
/// the declaration declares a constructor whose name is `C`.
///
/// Without this special rule, such a declaration would declare a constructor
/// named `C.C`. With this rule it declares a constructor named `C`, which is
/// the same as today.
///
/// @description Check that a factory constructor may omit the class name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1 {
  final int v;
  const C1.foo(this.v);
  const factory fC1(int v) = C1.foo;
}

class C2 {
  int v;
  C2.foo(this.v);
  factory fC2(int v) => C2.foo(v + 1);
}

enum E1 {
  e0;
  const E1();
  factory fE1() => E1.e0;
}

extension type ET1._(int v) {
  factory fET1() => ET1._(0);
}

extension type const ET2(int v) {
  const factory fET2(int v) = ET2.new;
}

main() {
  Expect.equals(1, C1.fC1(1).v);
  Expect.equals(2, (const C1.fC1(1)).v);
  Expect.equals(2, C2.fC2(1).v);
  Expect.equals(E1.e0, E1.fE1());
  Expect.equals(0, ET1.fET1().v);
  Expect.equals(2, ET2.fET2(2).v);
}
