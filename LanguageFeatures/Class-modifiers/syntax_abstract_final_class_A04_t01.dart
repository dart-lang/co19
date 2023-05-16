// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an
/// `abstract final class` is mixed in outside of the library where it is
/// defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                               ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                               ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                        ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                       ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractFinalClass1 with AbstractFinalClass {}
//                                                                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                                                           ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithAbstractFinalClass with AbstractFinalClass {e1, e2}
//                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithAbstractFinalClass1);
  print(ClassWithAbstractFinalClass2);
  print(BaseClassWithAbstractFinalClass1);
  print(BaseClassWithAbstractFinalClass2);
  print(InterfaceClassWithAbstractFinalClass1);
  print(InterfaceClassWithAbstractFinalClass2);
  print(FinalClassWithAbstractFinalClass1);
  print(FinalClassWithAbstractFinalClass2);
  print(SealedClassWithAbstractFinalClass1);
  print(SealedClassWithAbstractFinalClass2);
  print(AbstractClassWithAbstractFinalClass1);
  print(AbstractClassWithAbstractFinalClass2);
  print(AbstractBaseClassWithAbstractFinalClass1);
  print(AbstractBaseClassWithAbstractFinalClass2);
  print(AbstractInterfaceClassWithAbstractFinalClass1);
  print(AbstractInterfaceClassWithAbstractFinalClass2);
  print(AbstractFinalClassWithAbstractFinalClass1);
  print(AbstractFinalClassWithAbstractFinalClass2);
  print(EnumWithAbstractFinalClass);
}
