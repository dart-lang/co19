// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if a final library or
/// static variable has no initializer after all augmentations are applied. Test
/// augmenting getters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

final int? topLevelVariable;
//         ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment int? get topLevelVariable;

class C {
  static final int? staticVariable;
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment static int? get staticVariable;
}

mixin M {
  static final int? staticVariable;
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static int? get staticVariable;
}

enum E {
  e0;
  static final int? staticVariable;
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment static int? get staticVariable;
}

class A {}

extension Ext on A {
  static final int? staticVariable;
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static int? get staticVariable;
}

extension type ET(int _) {
  static final int? staticVariable;
//                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static int? get staticVariable;
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
