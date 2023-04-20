// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if a `base class` is
/// mixed in a `base/final/sealed` class (other cases tested in
/// `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class LocalBaseClass {}

base class BaseClassWithBaseClass1 with BaseClass {}
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithBaseClass2 = Object with BaseClass;
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithBaseClass1 with BaseClass {}
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithBaseClass2 = Object with BaseClass;
//                                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithBaseClass1 with BaseClass {}
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithBaseClass2 = Object with BaseClass;
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithBaseClass1 with BaseClass {}
//                                                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithBaseClass2 = Object with BaseClass;
//                                                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithBaseClass1 with BaseClass {}
//                                                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithBaseClass2 = Object with BaseClass;
//                                                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithBaseClass with BaseClass {e1, e2}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithLocalBaseClass1 with LocalBaseClass {}
//                                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithLocalBaseClass2 = Object with LocalBaseClass;
//                                                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithLocalBaseClass1 with LocalBaseClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithLocalBaseClass2 = Object with LocalBaseClass;
//                                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithLocalBaseClass1 with LocalBaseClass {}
//                                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithLocalBaseClass2 = Object with LocalBaseClass;
//                                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithLocalBaseClass1 with LocalBaseClass {}
//                                                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithLocalBaseClass2 = Object with LocalBaseClass;
//                                                                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithLocalBaseClass1 with LocalBaseClass {}
//                                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithLocalBaseClass2 = Object with LocalBaseClass;
//                                                                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithLocalBaseClass with LocalBaseClass {e1, e2}
//                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClassWithBaseClass1);
  print(BaseClassWithBaseClass2);
  print(FinalClassWithBaseClass1);
  print(FinalClassWithBaseClass2);
  print(SealedClassWithBaseClass1);
  print(SealedClassWithBaseClass2);
  print(AbstractBaseClassWithBaseClass1);
  print(AbstractBaseClassWithBaseClass2);
  print(AbstractFinalClassWithBaseClass1);
  print(AbstractFinalClassWithBaseClass2);
  print(EnumWithBaseClass);

  print(BaseClassWithLocalBaseClass1);
  print(BaseClassWithLocalBaseClass2);
  print(FinalClassWithLocalBaseClass1);
  print(FinalClassWithLocalBaseClass2);
  print(SealedClassWithLocalBaseClass1);
  print(SealedClassWithLocalBaseClass2);
  print(AbstractBaseClassWithLocalBaseClass1);
  print(AbstractBaseClassWithLocalBaseClass2);
  print(AbstractFinalClassWithLocalBaseClass1);
  print(AbstractFinalClassWithLocalBaseClass2);
  print(EnumWithLocalBaseClass);
}
