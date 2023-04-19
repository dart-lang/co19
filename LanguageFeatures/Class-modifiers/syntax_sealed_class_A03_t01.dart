// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is a compile-time error if `sealed class`
/// is implemented outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassImplementsSealedClass implements SealedClass {}
//                                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassImplementsSealedClass implements SealedClass {}
//                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsSealedClass implements SealedClass {}
//                                                             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassImplementsSealedClass implements SealedClass {}
//                                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassImplementsSealedClass implements SealedClass {}
//                                                       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsSealedClass implements SealedClass {}
//                                                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassImplementsSealedClass implements SealedClass {}
//                                                                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsSealedClass implements SealedClass {}
//                                                                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassImplementsSealedClass implements SealedClass {}
//                                                                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsSealedClass implements SealedClass {}
//                                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsSealedClass implements SealedClass {}
//                                                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsSealedClass implements SealedClass {}
//                                                                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsSealedClass implements SealedClass {}
//                                                                               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsSealedClass implements SealedClass {}
//                                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsSealedClass implements SealedClass {}
//                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsSealedClass);
  print(BaseClassImplementsSealedClass);
  print(InterfaceClassImplementsSealedClass);
  print(FinalClassImplementsSealedClass);
  print(SealedClassImplementsSealedClass);
  print(AbstractClassImplementsSealedClass);
  print(AbstractBaseClassImplementsSealedClass);
  print(AbstractInterfaceClassImplementsSealedClass);
  print(AbstractFinalClassImplementsSealedClass);
  print(MixinClassImplementsSealedClass);
  print(BaseMixinClassImplementsSealedClass);
  print(AbstractMixinClassImplementsSealedClass);
  print(AbstractBaseMixinClassImplementsSealedClass);
  print(MixinImplementsSealedClass);
  print(BaseMixinImplementsSealedClass);
}
