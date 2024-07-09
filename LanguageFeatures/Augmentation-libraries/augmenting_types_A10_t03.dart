// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augment of a
/// class, mixin, extension, or enum adds an instance member but there is an
/// existing static member with the same name
/// @author sgrekhov22@gmail.com
/// @issue 55452

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A10_t03_lib.dart';

class A {
  static int foo() => 42;
}

class C {
  static int foo() => 42;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int get foo => 42;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  static void set foo(String _) {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtA on A {
  static void bar() {}
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(C);
  print(M);
  print(E);
}
