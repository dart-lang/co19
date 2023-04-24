// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if `final class`
/// is mixed in inside the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class FinalClass {}

class ClassWithFinalClass1 with FinalClass {}
//                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithFinalClass2 = Object with FinalClass;
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithFinalClass1 with FinalClass {}
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithFinalClass2 = Object with FinalClass;
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithFinalClass1 with FinalClass {}
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithFinalClass2 = Object with FinalClass;
//                                                          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithFinalClass1 with FinalClass {}
//                                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithFinalClass2 = Object with FinalClass;
//                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithFinalClass1 with FinalClass {}
//                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithFinalClass2 = Object with FinalClass;
//                                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithFinalClass1 with FinalClass {}
//                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithFinalClass2 = Object with FinalClass;
//                                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithFinalClass1 with FinalClass {}
//                                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithFinalClass2 = Object with FinalClass;
//                                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithFinalClass1 with FinalClass {}
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithFinalClass2 = Object with FinalClass;
//                                                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithFinalClass1 with FinalClass {}
//                                                          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithFinalClass2 = Object with FinalClass;
//                                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithFinalClass with FinalClass {e1, e2}
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithFinalClass1);
  print(ClassWithFinalClass2);
  print(BaseClassWithFinalClass1);
  print(BaseClassWithFinalClass2);
  print(InterfaceClassWithFinalClass1);
  print(InterfaceClassWithFinalClass2);
  print(FinalClassWithFinalClass1);
  print(FinalClassWithFinalClass2);
  print(SealedClassWithFinalClass1);
  print(SealedClassWithFinalClass2);
  print(AbstractClassWithFinalClass1);
  print(AbstractClassWithFinalClass2);
  print(AbstractBaseClassWithFinalClass1);
  print(AbstractBaseClassWithFinalClass2);
  print(AbstractInterfaceClassWithFinalClass1);
  print(AbstractInterfaceClassWithFinalClass2);
  print(AbstractFinalClassWithFinalClass1);
  print(AbstractFinalClassWithFinalClass2);
  print(EnumWithFinalClass);
}
