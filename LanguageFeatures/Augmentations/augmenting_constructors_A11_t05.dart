// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that it is a compile-time error if a `new` keyword is
/// used as a constructor name in the factory constructor redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1 {
  C1();
  factory C1.someName();
}

augment class C1 {
  augment factory C1.someName() = new;
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2.someName();
  factory C2();
}

augment class C2 {
  augment factory C2() = new.someName;
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  const C3();
  const factory C3.someName();
}

augment class C3 {
  augment const factory C3.someName() = new;
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  const C4.someName();
  const factory C4();
}

augment class C4 {
  const augment factory C4() = new.someName;
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int v) {
  ET1(this.v);
  factory ET1.someName(int v);
}

augment extension type ET1 {
  augment factory ET1.someName(int v) = new;
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int v) {
  ET2.someName(this.v);
  factory ET2(int v);
}

augment extension type ET2 {
  augment factory ET2(int v) = new.someName;
//                             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3._(int v) {
  const ET3(this.v);
  const factory ET3.someName(int v);
}

augment extension type ET3 {
  augment const factory ET3.someName(int v) = new;
//                                            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4._(int v) {
  const ET4.someName(this.v);
  const factory ET4(int v);
}

augment extension type ET4 {
  augment const factory ET4(int v) = new.someName;
//                                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  const E();
  factory E.f1() = E;
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
