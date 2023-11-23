// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an
/// `abstract base class` is mixed in a `base/final/sealed` class (other cases
/// tested in `basic_restrictions_A04_t*`) outside of the library where it is
/// defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class BaseClassWithAbstractBaseClass1 with AbstractBaseClass {}
//                                              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractBaseClass2 = Object with AbstractBaseClass;
//                                                       ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractBaseClass1 with AbstractBaseClass {}
//                                                ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractBaseClass2 = Object with AbstractBaseClass;
//                                                         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractBaseClass1 with AbstractBaseClass {}
//                                                  ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractBaseClass2 = Object with AbstractBaseClass;
//                                                           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractBaseClass1 with AbstractBaseClass {}
//                                                               ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractBaseClass2 = Object with AbstractBaseClass;
//                                                                        ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractBaseClass1 with AbstractBaseClass {}
//                                                                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractBaseClass2 = Object with AbstractBaseClass;
//                                                                          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractBaseClass with AbstractBaseClass {e1, e2}
//                                  ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClassWithAbstractBaseClass1);
  print(BaseClassWithAbstractBaseClass2);
  print(FinalClassWithAbstractBaseClass1);
  print(FinalClassWithAbstractBaseClass2);
  print(SealedClassWithAbstractBaseClass1);
  print(SealedClassWithAbstractBaseClass2);
  print(AbstractBaseClassWithAbstractBaseClass1);
  print(AbstractBaseClassWithAbstractBaseClass2);
  print(AbstractFinalClassWithAbstractBaseClass1);
  print(AbstractFinalClassWithAbstractBaseClass2);
  print(EnumWithAbstractBaseClass);
}
