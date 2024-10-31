// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a variable with a setter, this will invoke the implicitly
///   induced setter from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error for an augmenting
/// setter to have as a parameter of a type whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A02_t17_lib.dart';

class augmented {}

void set topLevelSetter(augmented value) {}

class C {
  static void set staticSetter(augmented value) {}
  void set instanceSetter(augmented value) {}
}

mixin M {
  static void set staticSetter(augmented value) {}
  void set instanceSetter(augmented value) {}
}

enum E {
  e1;
  static void set staticSetter(augmented value) {}
  void set instanceSetter(augmented value) {}
}

class A {}

extension Ext on A {
  static void set staticSetter(augmented value) {}
  void set instanceSetter(augmented value) {}
}

extension type ET(int _) {
  static void set staticSetter(augmented value) {}
  void set instanceSetter(augmented value) {}
}

main() {
  topLevelSetter = "";
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
