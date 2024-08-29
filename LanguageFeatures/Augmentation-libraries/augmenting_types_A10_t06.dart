// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augment of a
/// class, mixin, extension, enum or extension type adds a static member but
/// there is an existing instance member with the same name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A10_t06_lib1.dart';
import augment 'augmenting_types_A10_t06_lib2.dart';

class A {
  int foo() => 42;
}

abstract class C {}

mixin M {}

enum E {
  e1;
}

extension ExtA on A {}

extension type ET(int id) {}

main() {
  print(A);
  print(C);
  print(M);
  print(E);
  print(ET);
}
