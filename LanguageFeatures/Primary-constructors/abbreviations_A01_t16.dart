// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is a compile-time error to declare both the `new`
/// and the `factory` constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  new _();
  new();
  factory() => C1._();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  new _();
  factory() => C2._();
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M1 {
  new _();
  new();
  factory() => M1._();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2 {
  new _();
  factory() => M2._();
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0._();

  const new _();
  const new();
  factory() => E1.e0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0._();

  const new _();
  factory() => E2.e0;
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int v) {
  new(this.v);
  factory(int x) => ET1._(x);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int v) {
  factory(int x) => ET2._(x);
  new(this.v);
//^^^
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
