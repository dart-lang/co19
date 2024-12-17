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
/// @description Checks that it is a compile-time error if in an augmenting
/// scope an augmenting setter has a metadata named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

const augmented = 0;

@augmented
void set topLevelSetter(String value) {}

@augmented 
augment void set topLevelSetter(String value) {}

class C {
  @augmented
  static void set staticSetter1(String value) {}
  @augmented
  void set instanceSetter1(String value) {}

  @augmented
  augment static void set staticSetter1(String value);
  @augmented
  augment void set instanceSetter1(String value);
}

augment class C {
  @augmented augment static void set staticSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented static void set staticSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented augment void set instanceSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented void set instanceSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  @augmented
  static void set staticSetter1(String value) {}
  @augmented
  void set instanceSetter1(String value) {}

  @augmented
  augment static void set staticSetter1(String value);
  @augmented
  augment void set instanceSetter1(String value);
}

augment mixin M {
  @augmented augment static void set staticSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented static void set staticSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented augment void set instanceSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented void set instanceSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  @augmented
  static void set staticSetter1(String value) {}
  @augmented
  void set instanceSetter1(String value) {}

  @augmented
  augment static void set staticSetter1(String value);
  @augmented
  augment void set instanceSetter1(String value);
}

augment enum E {
  e1;

  @augmented augment static void set staticSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented static void set staticSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented augment void set instanceSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented void set instanceSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  @augmented
  static void set staticSetter1(String value) {}
  @augmented
  void set instanceSetter1(String value) {}

  @augmented
  augment static void set staticSetter1(String value);
  @augmented
  augment void set instanceSetter1(String value);
}

augment extension Ext {
  @augmented augment static void set staticSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented static void set staticSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented augment void set instanceSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented void set instanceSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  @augmented
  static void set staticSetter1(String value) {}
  @augmented
  void set instanceSetter1(String value) {}

  @augmented
  augment static void set staticSetter1(String value);
  @augmented
  augment void set instanceSetter1(String value);
}

augment extension type ET {
  @augmented augment static void set staticSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented static void set staticSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented augment void set instanceSetter1(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented void set instanceSetter2(String value) {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelSetter = "1";
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
