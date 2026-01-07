// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the augmenting
/// type, including enum values, are added to the instance or static namespace
/// of the corresponding type in the introductory declaration. In other words,
/// the augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augment of a
/// class, mixin, extension, enum or extension type adds an instance member but
/// there is an existing instance member with the same name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class C {
  int foo();
  int operator +(int other);
}

augment abstract class C {
  int foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  int operator +(int other);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  int get foo => 42;
  int operator +(int other) => other;
}

augment mixin M {
  int foo() => 42;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  int operator +(int other) => other;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  void set foo(String _) {}
  int operator +(int other) => other;
}

augment enum E {
  ;
  int foo() => 42;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  int operator +(int other) => other;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {
  int foo() => 42;
  int operator -(int other) => other;
}

extension ExtA on A {
  void bar() {}
  int operator +(int other) => other;
}

augment extension ExtA {
  int get foo => 42; // No error, no conflict with A.foo()
  void set bar(String _) {}
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  int operator -(int other) => other; // No error, no conflict with A.-()
  int operator +(int other) => other;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  int get foo => 42;
  int operator +(int other) => other;
}

augment extension type ET {
  int foo() => 42;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  int operator +(int other) => other;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(C);
  print(M);
  print(E);
  print(ET);
}
