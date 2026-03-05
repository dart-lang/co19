// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if a library or static
/// variable with a non-nillable type has no initializer after all augmentations
/// are applied. Test augmenting getters/setters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int topLevelVariable;
//  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment int get topLevelVariable;
augment void set topLevelVariable(int _);

class C {
  static int staticVariable;
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment static int get staticVariable;
  augment static void set staticVariable(int _);
}

mixin M {
  static int staticVariable;
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static int get staticVariable;
  augment static void set staticVariable(int _);
}

enum E {
  e0;
  static int staticVariable;
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment static int get staticVariable;
  augment static void set staticVariable(int _);
}

class A {}

extension Ext on A {
  static int staticVariable;
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static int get staticVariable;
  augment static void set staticVariable(int _);
}

extension type ET(int _) {
  static int staticVariable;
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static int get staticVariable;
  augment static void set staticVariable(int _);
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
