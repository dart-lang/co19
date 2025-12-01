// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error to add a body to already
/// completed top level function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1() {}

augment void topLevelFunction1() {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction2(String v) {}

augment void topLevelFunction2(String v) {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction3(String v1, [String v2 = "v2 def"]) {}

augment void topLevelFunction3(String v1, [String v2 = "v2 def"]) {}
//                                                                ^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction4(String v1, {String v2 = "v2 def"}) {}

augment void topLevelFunction4(String v1, {String v2 = "v2 def"}) {}
//                                                                ^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction5(String v1, {required String v2}) {}

augment void topLevelFunction5(String v1, {required String v2}) {}
//                                                              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(topLevelFunction4);
  print(topLevelFunction5);
}
