// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is a compile-time error to declare both a
/// `new name` and a `factory name` constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  new();
  new name();
  factory name() => C1();
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  new();
  factory name() => C2();
  new name();
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M1 {
  new();
  new name();
  factory name() => M1();
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2 {
  new();
  factory name() => M2();
  new name();
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0();

  const new();
  const new name();
  factory name() => E1.e0;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0();

  const new();
  factory name() => E2.e0;
  const new name();
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int v) {
  new name(this.v);
  factory name(int x) => ET1(x);
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int v) {
  factory name(int x) => ET2(x);
  new name(this.v);
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
