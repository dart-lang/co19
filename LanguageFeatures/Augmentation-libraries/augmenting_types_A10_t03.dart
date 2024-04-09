// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augment of a
/// class, mixin, extension or enum adds an instance member but the is an
/// existing static member with the same name
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A10_t03_lib.dart';

class A {
  static int foo() => 42;
}

class C {
  static int foo() => 42;
}

mixin M {
  static int get foo => 42;
}

enum E {
  e1;
  static void set foo(String _) {}
}

extension ExtA on A {
  static void bar() {}
}

main() {
  print(A);
  print(C);
  print(M);
  print(E);
}
