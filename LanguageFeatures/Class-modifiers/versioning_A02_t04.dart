// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is a compile-time error if an enum declaration
/// from a pre-future library mixes in a declaration marked `base` or `final`
/// from a post-feature library
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

enum EnumWithBase with BaseClass {e1, e2}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractBase with AbstractBaseClass {e1, e2}
//                             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithBaseMixinClass with BaseMixinClass {e1, e2}
//                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractBaseMixinClass with AbstractBaseMixinClass {e1, e2}
//                                       ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithBaseMixin with BaseMixin {e1, e2}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithFinal with FinalClass {e1, e2}
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractFinal with AbstractFinalClass {e1, e2}
//                              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(EnumWithBase);
  print(EnumWithAbstractBase);
  print(EnumWithBaseMixinClass);
  print(EnumWithAbstractBaseMixinClass);
  print(EnumWithBaseMixin);
  print(EnumWithFinal);
  print(EnumWithAbstractFinal);
}
