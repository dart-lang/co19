// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a field with a setter, this will invoke the implicit setter
///   from the augmented field.
///
/// @description Checks that it is a compile-time error if within an augmenting
/// setter `augmented()` function is invoked.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A02_t03_lib.dart';

void augmented() {}

void set topLevelSetter(String value) {}


class C {
  static void set staticSetter(String value) {}
  void set instanceSetter(String value) {}
  void augmented() {}
}

mixin M {
  static void set staticSetter(String value) {}
  void set instanceSetter(String value) {}
  void augmented() {}
}

enum E {
  e1;
  static void set staticSetter(String value) {}
  void set instanceSetter(String value) {}
  void augmented() {}
}

class A {}

extension Ext on A {
  static void set staticSetter(String value) {}
  void set instanceSetter(String value) {}
  void augmented() {}
}

main() {
  topLevelSetter = "";
  print(C);
  print(M);
  print(E);
  print(A);
}
