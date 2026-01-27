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
/// @description Checks that it is a compile-time error to augment an external
/// implicit getter by another complete getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

external final String topLevelVariable1;
augment String get topLevelVariable1 => "y";
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

external final String topLevelVariable2;
// An external getter is considered to have a body
augment external String get topLevelVariable2;
//                          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  external static final String staticVariable;
  external final String instanceVariable;
}

augment class C {
  augment static String get staticVariable => "y";
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String get instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  external static final String staticVariable;
  external final String instanceVariable;
}

augment mixin M {
  augment external static String get staticVariable;
//                                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get instanceVariable => "y";
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  external static final String staticVariable;
  external final String instanceVariable;
}

augment enum E {
  ;
  augment static String get staticVariable => "y";
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external String get instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  external static final String staticVariable1;
  external static final String staticVariable2;
}

augment extension Ext {
  augment static String get staticVariable1 => "y";
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external static String get staticVariable2;
//                                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  external static final String staticVariable1;
  external static final String staticVariable2;
}

augment extension type ET {
  augment static String get staticVariable1 => "y";
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  augment external static String get staticVariable2;
//                                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelVariable1;
  topLevelVariable2;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
