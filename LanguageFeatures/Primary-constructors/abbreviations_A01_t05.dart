// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is a compile-time error to declare both a
/// constructor named after the class and a constructor named `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  C1();
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  new();
  C2();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M1 {
  M1();
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2 {
  new();
  M2();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  const E1();
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;

  const new();
  const E2();
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1.name(int v) {
  ET1(this.v);
  new(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.name(int v) {
  new(this.v);
  ET2(this.v);
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
  print(ET2);
  print(ET2);
}
