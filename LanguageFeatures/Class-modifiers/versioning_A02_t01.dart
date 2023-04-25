// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is a compile-time error if a declaration from
/// pre-future library depends on a `sealed` declaration from post-feature
/// library.
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

class ExtendsSealed extends SealedClass {}
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsSealed extends SealedClass {}
//                                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithSealed1 with SealedClass {}
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithSealed2 = Object with SealedClass;
//                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithSealed1 with SealedClass {}
//                                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithSealed2 = Object with SealedClass;
//                                               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsSealed implements SealedClass {}
//                                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsSealed implements SealedClass {}
//                                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnSealedClass on SealedClass {}
//                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsSealedClass implements SealedClass {}
//                                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsSealedClass implements SealedClass {e1, e2}
//                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithSealedClass with SealedClass {e1, e2}
//                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsSealed);
  print(AbstractExtendsSealed);
  print(WithSealed1);
  print(WithSealed2);
  print(AbstractWithSealed1);
  print(AbstractWithSealed2);
  print(ImplementsSealed);
  print(AbstractImplementsSealed);
  print(MixinOnSealedClass);
  print(MixinImplementsSealedClass);
  print(EnumImplementsSealedClass);
  print(EnumWithSealedClass);
}
