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
/// @description Check that a factory constructor may omit the class name. Test
/// `external` constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  final int v;
  const C1.foo(this.v);
  external factory fC1(int v);
}

class C2 {
  int v;
  C2.foo(this.v);
  external const factory fC2(int v);
}

enum E1 {
  e0;
  const E1();
  external factory fE1();
}

enum E2 {
  e0;
  const E2();
  external const factory fE2();
}

extension type ET1._(int v) {
  external factory fET1();
}

extension type const ET2(int v) {
  external const factory fET2(int v);
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
