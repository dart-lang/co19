// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, all other declarations of formal parameters as
/// `final` will be a compile-time error. This ensures that `final int x` is
/// unambiguously a declaring parameter. Developers who wish to maintain a style
/// whereby formal parameters are never modified will have a lint to flag all
/// such mutations.
///
/// Similarly, with this feature a regular (non-declaring) formal parameter can
/// not use the syntax `var name`, it must have a type (`T name`) or the type
/// must be omitted (`name`).
///
/// @description Check that it is a compile-time error to declare an operator
/// with a `var` formal parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  bool operator ==(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator |(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ^(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator &(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator <<(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>>(var other) => 0;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator +(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator /(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ~/(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator %(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator [](var index) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void operator []=(var index, int value) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  void operator []=(int index, var value) {}
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 {
  bool operator ==(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator |(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ^(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator &(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator <<(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>>(var other) => 0;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator +(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator /(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ~/(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator %(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator [](var index) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void operator []=(var index, int value) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 {
  void operator []=(int index, var value) {}
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  bool operator >(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator |(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ^(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator &(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator <<(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>>(var other) => 0;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator +(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator /(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ~/(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator %(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator [](var index) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void operator []=(var index, int value) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
  void operator []=(int index, var value) {}
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext1 on A {
  bool operator >(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator |(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ^(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator &(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator <<(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>>(var other) => 0;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator +(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator /(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ~/(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator %(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator [](var index) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void operator []=(var index, int value) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 on A {
  void operator []=(int index, var value) {}
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int _) {
  bool operator >(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <(var other) => true;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator >=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool operator <=(var other) => true;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator |(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ^(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator &(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator <<(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>(var other) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator >>>(var other) => 0;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator +(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator /(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator ~/(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator %(var other) => 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator [](var index) => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void operator []=(var index, int value) {}
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int _) {
  void operator []=(int index, var value) {}
//                             ^^^
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
  print(A);
  print(ET1);
  print(ET2);
}
