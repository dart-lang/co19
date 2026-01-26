// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion More precisely, a function or constructor declaration
/// (introductory or augmenting) is incomplete if all of:
/// - It has no body. That means no `{ ... }` or `=> ...;` but only `;`.
/// - The function is not marked external. An external function is considered to
///   have a body, just not one that is visible as Dart code.
/// - There is no redirection, initializer list, initializing formals, field
///   parameters, or super parameters. Obviously, this only applies to
///   constructor declarations.
///
/// If a declaration is not incomplete then it is complete.
///
/// It's a compile-time error if an augmentation is complete and any declaration
/// before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error to add a body to an
/// external getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

external String get topLevelGetter1;
augment String get topLevelGetter1 => "y";
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

external String get topLevelGetter2;
augment external String get topLevelGetter2;
//                          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  external static String get staticGetter;
  external String get instanceGetter;
}

augment class C {
  augment static String get staticGetter => "y";
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String get instanceGetter;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  external static String get staticGetter;
  external String get instanceGetter;
}

augment mixin M {
  augment external static String get staticGetter;
//                                   ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get instanceGetter => "y";
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  external static String get staticGetter;
  external String get instanceGetter;
}

augment enum E {
  ;
  augment static String get staticGetter => "y";
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String get instanceGetter;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  external static String get staticGetter;
  external String get instanceGetter;
}

augment extension Ext {
  augment static String get staticGetter => "y";
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String get instanceGetter;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  external static String get staticGetter;
  external String get instanceGetter;
}

augment extension type ET {
  augment static String get staticGetter => "y";
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String get instanceGetter;
//                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelGetter1;
  topLevelGetter2;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
