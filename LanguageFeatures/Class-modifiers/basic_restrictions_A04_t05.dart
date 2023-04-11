// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is a compile-time error if a declaration is not
/// `base`, `final` or `sealed` and has a superdeclaration marked `sealed`. Test
/// `sealed` superdeclaration in another library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsSealedClass extends SealedClass {}
//                               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsSealedClass extends SealedClass {}
//                                                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsSealedClass extends SealedClass {}
//                                                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsSealedClass extends SealedClass {}
//                                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsSealedClass implements SealedClass {}
//                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsSealedClass implements SealedClass {}
//                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsSealedClass implements SealedClass {}
//                                                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsSealedClass implements SealedClass {}
//                                                                         ^^^^^^^^^^^
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

mixin class MixinClassImplementsSealedClass implements SealedClass {}
//                                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsSealedClass implements SealedClass {}
//                                                                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsSealedClass implements SealedClass {e1, e2}
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsSealedClass);
  print(InterfaceExtendsSealedClass);
  print(AbstractExtendsSealedClass);
  print(AbstractInterfaceExtendsSealedClass);
  print(ImplementsSealedClass);
  print(InterfaceImplementsSealedClass);
  print(AbstractImplementsSealedClass);
  print(AbstractInterfaceImplementsSealedClass);
  print(MixinOnSealedClass);
  print(MixinImplementsSealedClass);
  print(MixinClassImplementsSealedClass);
  print(AbstractMixinClassImplementsSealedClass);
  print(EnumImplementsSealedClass);
}
