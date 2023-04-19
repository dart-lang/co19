// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an
/// `abstract base class` is mixed in in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract base class AbstractBaseClass {}

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
}
