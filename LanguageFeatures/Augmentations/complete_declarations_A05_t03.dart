// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error to augment an already
/// complete setter by another complete implicit setter (a variable).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void set topLevelVariable(String _) {}
augment String topLevelVariable = "x";
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void set staticVariable(String _) {}
  void set instanceVariable(String _) {}
}

augment class C {
  augment static String staticVariable = "x";
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "x";
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void set staticVariable(String _) {}
  void set instanceVariable(String _) {}
}

augment mixin M {
  augment static String staticVariable = "x";
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "x";
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void set staticVariable(String _) {}
  void set instanceVariable(String _) {}
}

augment enum E {
  ;
  augment static String staticVariable = "x";
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "x";
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void set staticVariable(String _) {}
  void set instanceVariable(String _) {}
}

augment extension Ext {
  augment static String staticVariable = "x";
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "x";
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void set staticVariable(String _) {}
  void set instanceVariable(String _) {}
}

augment extension type ET {
  augment static String staticVariable = "x";
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "x";
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevelVariable = "";
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
