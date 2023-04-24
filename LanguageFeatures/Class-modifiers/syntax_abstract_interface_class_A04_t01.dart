// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an
/// `abstract interface class` is mixed in outside of the library where it is
/// defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                          ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                            ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                             ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                       ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                           ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                                    ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                                    ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                                             ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                                                       ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                                                               ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractInterfaceClass with AbstractInterfaceClass {e1, e2}
//                                       ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithAbstractInterfaceClass1);
  print(ClassWithAbstractInterfaceClass2);
  print(BaseClassWithAbstractInterfaceClass1);
  print(BaseClassWithAbstractInterfaceClass2);
  print(InterfaceClassWithAbstractInterfaceClass1);
  print(InterfaceClassWithAbstractInterfaceClass2);
  print(FinalClassWithAbstractInterfaceClass1);
  print(FinalClassWithAbstractInterfaceClass2);
  print(SealedClassWithAbstractInterfaceClass1);
  print(SealedClassWithAbstractInterfaceClass2);
  print(AbstractClassWithAbstractInterfaceClass1);
  print(AbstractClassWithAbstractInterfaceClass2);
  print(AbstractBaseClassWithAbstractInterfaceClass1);
  print(AbstractBaseClassWithAbstractInterfaceClass2);
  print(AbstractInterfaceClassWithAbstractInterfaceClass1);
  print(AbstractInterfaceClassWithAbstractInterfaceClass2);
  print(AbstractFinalClassWithAbstractInterfaceClass1);
  print(AbstractFinalClassWithAbstractInterfaceClass2);
  print(EnumWithAbstractInterfaceClass);
}
