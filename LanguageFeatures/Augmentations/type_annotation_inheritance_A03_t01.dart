// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it not an error if an augmentation omits the bounds
/// type parameters of a class-like declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int get topLevel => 42;

void set topLevel(String v) {}

augment abstract var topLevel;
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}
  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment class C {
  augment static abstract var staticVariable;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract var instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}
  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment mixin M {
  augment static abstract var staticVariable;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract var instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}
}

augment enum E {
  ;
  augment static abstract var staticVariable;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}
}

augment extension Ext on A {
  augment static abstract var staticVariable;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  static int get staticVariable => 42;
  static void set staticVariable(String v) {}
}

extension type ET {
  augment static abstract var staticVariable;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevel);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
