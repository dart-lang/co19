// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is a compile-time error if `sealed class`
/// is mixed in outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassWithSealedClass1 with SealedClass {}
//                               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithSealedClass2 = Object with SealedClass;
//                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithSealedClass1 with SealedClass {}
//                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithSealedClass2 = Object with SealedClass;
//                                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithSealedClass1 with SealedClass {}
//                                                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithSealedClass2 = Object with SealedClass;
//                                                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithSealedClass1 with SealedClass {}
//                                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithSealedClass2 = Object with SealedClass {}
//                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithSealedClass1 with SealedClass {}
//                                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithSealedClass2 = Object with SealedClass;
//                                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithSealedClass1 with SealedClass {}
//                                                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithSealedClass2 = Object with SealedClass;
//                                                         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithSealedClass1 with SealedClass {}
//                                                         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithSealedClass2 = Object with SealedClass;
//                                                                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithSealedClass1 with SealedClass {}
//                                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithSealedClass2 = Object with SealedClass;
//                                                                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithSealedClass1 with SealedClass {}
//                                                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithSealedClass2 = Object with SealedClass;
//                                                                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithSealedClass1);
  print(ClassWithSealedClass2);
  print(BaseClassWithSealedClass1);
  print(BaseClassWithSealedClass2);
  print(InterfaceClassWithSealedClass1);
  print(InterfaceClassWithSealedClass2);
  print(FinalClassWithSealedClass1);
  print(FinalClassWithSealedClass2);
  print(SealedClassWithSealedClass1);
  print(SealedClassWithSealedClass2);
  print(AbstractClassWithSealedClass1);
  print(AbstractClassWithSealedClass2);
  print(AbstractBaseClassWithSealedClass1);
  print(AbstractBaseClassWithSealedClass2);
  print(AbstractInterfaceClassWithSealedClass1);
  print(AbstractInterfaceClassWithSealedClass2);
  print(AbstractFinalClassWithSealedClass1);
  print(AbstractFinalClassWithSealedClass2);
}
