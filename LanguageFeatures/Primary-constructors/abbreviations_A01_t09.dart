// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is still a compile-time error to declare a static
/// member with the basename `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  static new() {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  static get new => C2();
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  static void set new(C3 _) {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  static C4 new = C4();
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M1 {
  static new() {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2 {
  static get new => M2();
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M3 {
  static void set new(M3 _) {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M4 {
  static M4 new = M4();
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;
//^^
// [cfe] unspecified

  static new() {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;

  static get new => E2.e0;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e0;

  static set new(E3 _) {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4 {
  e0;

  static E4 new = E4.e0;
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int _) {
  static new() {}
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int _) {
  static get new => ET2._(0);
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3._(int _) {
  static set new(ET3 _) {}
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4._(int _) {
  static ET4 new = ET4._(0);
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
