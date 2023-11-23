// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if a `base class` is
/// implemented by `base/final/sealed` outside of the library where it is
/// defined (other cases tested in `basic_restrictions_A03_t*`)
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class BaseClassImplementsBaseClass implements BaseClass {}
//                                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassImplementsBaseClass implements BaseClass {}
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassImplementsBaseClass implements BaseClass {}
//                                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassImplementsBaseClass implements BaseClass {}
//                                                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassImplementsBaseClass implements BaseClass {}
//                                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsBaseClass implements BaseClass {}
//                                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassImplementsBaseClass implements BaseClass {}
//                                                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsBaseClass implements BaseClass {}
//                                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseClass implements BaseClass {e1, e2}
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClassImplementsBaseClass);
  print(FinalClassImplementsBaseClass);
  print(SealedClassImplementsBaseClass);
  print(AbstractBaseClassImplementsBaseClass);
  print(AbstractFinalClassImplementsBaseClass);
  print(BaseMixinClassImplementsBaseClass);
  print(AbstractBaseMixinClassImplementsBaseClass);
  print(BaseMixinImplementsBaseClass);
  print(EnumImplementsBaseClass);
}
