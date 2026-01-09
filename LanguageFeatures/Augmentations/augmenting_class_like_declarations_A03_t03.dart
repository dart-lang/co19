// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the augmenting
/// type, including enum values, are added to the instance or static namespace
/// of the corresponding type in the introductory declaration. In other words,
/// the augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augmentation of a
/// class, mixin, extension, enum or extension type adds an instance member but
/// there is an existing static member with the same name.
/// @author sgrekhov22@gmail.com
/// @issue 55452

// SharedOptions=--enable-experiment=augmentations

class A {
  int foo() => 42;
}

class C {}

augment class C {
  static int foo() => 42;
}

augment class C {
  int foo() => 42;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {}

augment mixin M {
  static int foo() => 42;
}

augment mixin M {
  int get foo => 42;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
}

augment enum E {
  ;
  static int foo() => 42;
}

augment enum E {
  ;
  void set foo(String _) {}
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtA on A {}

augment extension ExtA {
  static int get foo => 42; // No error, no conflict with A().foo()

  static void set bar(String _) {}
}

augment extension ExtA {
   void bar() {}
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {}

augment extension type ET {
  static int get foo => 42;
}

augment extension type ET {
  int get foo => 42;
//        ^^^
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
