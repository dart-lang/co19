// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interface class can be constructed and implemented but not
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an `interface class`
/// is mixed in outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassWithInterfaceClass1 with InterfaceClass {}
//                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithInterfaceClass2 = Object with InterfaceClass;
//                                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithInterfaceClass1 with InterfaceClass {}
//                                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithInterfaceClass1 with InterfaceClass {}
//                                                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithInterfaceClass1 with InterfaceClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithInterfaceClass1 with InterfaceClass {}
//                                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithInterfaceClass1 with InterfaceClass {}
//                                                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithInterfaceClass1 with InterfaceClass {}
//                                                            ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithInterfaceClass1 with InterfaceClass {}
//                                                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithInterfaceClass1 with InterfaceClass {}
//                                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithInterfaceClass2 = Object with InterfaceClass;
//                                                                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithInterfaceClass with InterfaceClass {e1, e2}
//                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithInterfaceClass1);
  print(ClassWithInterfaceClass2);
  print(BaseClassWithInterfaceClass1);
  print(BaseClassWithInterfaceClass2);
  print(InterfaceClassWithInterfaceClass1);
  print(InterfaceClassWithInterfaceClass2);
  print(FinalClassWithInterfaceClass1);
  print(FinalClassWithInterfaceClass2);
  print(SealedClassWithInterfaceClass1);
  print(SealedClassWithInterfaceClass2);
  print(AbstractClassWithInterfaceClass1);
  print(AbstractClassWithInterfaceClass2);
  print(AbstractBaseClassWithInterfaceClass1);
  print(AbstractBaseClassWithInterfaceClass2);
  print(AbstractInterfaceClassWithInterfaceClass1);
  print(AbstractInterfaceClassWithInterfaceClass2);
  print(AbstractFinalClassWithInterfaceClass1);
  print(AbstractFinalClassWithInterfaceClass2);
  print(EnumWithInterfaceClass);
}
