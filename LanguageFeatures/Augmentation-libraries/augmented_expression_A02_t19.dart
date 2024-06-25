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
/// @description Checks that it is a compile-time error to augment a setter
/// whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A02_t19_lib.dart';

void set augmented(String value) {}

class C1 {
  static void set augmented(String value) {}
}

class C2 {
  void set augmented(String value) {}
}

mixin M1 {
  static void set augmented(String value) {}
}

mixin M2 {
  void set augmented(String value) {}
}

enum E1 {
  e1;
  static void set augmented(String value) {}
}

enum E2 {
  e1;
  void set augmented(String value) {}
}

class A {}

extension Ext1 on A {
  static void set augmented(String value) {}
}

extension Ext2 on A {
  void set augmented(String value) {}
}

main() {
  augmented = "";
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E1);
  print(E2);
  print(A);
}
