// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration `I`.
/// In other words, it's an error to have a declaration marked augment with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error if a setter is
/// augmenting a getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

String get topLevelGetter => "";

augment void set topLevelGetter(String _); // There is no setter to augment
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static String get staticGetter => "";
  String get instanceGetter => "";

  augment static void set staticGetter(String _);
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceGetter(String _);
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static String get staticGetter => "";
  String get instanceGetter => "";

  augment static void set staticGetter(String _);
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceGetter(String _);
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified}

enum E {
  e0;
  static String get staticGetter => "";
  String get instanceGetter => "";

  augment static void set staticGetter(String _);
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceGetter(String _);
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static String get staticGetter => "";
  String get instanceGetter => "";

  augment static void set staticGetter(String _);
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceGetter(String _);
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(String instanceVariable) {
  static String get staticGetter => "";
  String get instanceGetter => "";

  augment static void set staticGetter(String _);
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void set instanceGetter(String _);
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelGetter;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
