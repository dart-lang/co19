// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an
/// `abstract base class` is implemented outside of the library where it is
/// defined by `base/final/sealed class` (other cases tested in
/// `basic_restrictions_A03_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class BaseClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                                          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                                            ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                                    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                                                     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsAbstractBaseClass implements AbstractBaseClass {}
//                                                         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsAbstractBaseClass implements AbstractBaseClass {e1, e2}
//                                              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClassImplementsAbstractBaseClass);
  print(FinalClassImplementsAbstractBaseClass);
  print(SealedClassImplementsAbstractBaseClass);
  print(AbstractBaseClassImplementsAbstractBaseClass);
  print(AbstractFinalClassImplementsAbstractBaseClass);
  print(BaseMixinClassImplementsAbstractBaseClass);
  print(AbstractBaseMixinClassImplementsAbstractBaseClass);
  print(BaseMixinImplementsAbstractBaseClass);
  print(EnumImplementsAbstractBaseClass);
}
