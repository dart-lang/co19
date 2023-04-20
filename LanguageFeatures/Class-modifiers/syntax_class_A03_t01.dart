// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Class with no modifiers can be constructed, extended, implemented
/// but not mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if class with no
/// modifiers is mixed in in another library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassWithClass1 with Class {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithClass2 = Object with Class;
//                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithClass1 with Class {}
//                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithClass2 = Object with Class;
//                                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithClass1 with Class {}
//                                            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithClass2 = Object with Class;
//                                                     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithClass1 with Class {}
//                                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithClass2 = Object with Class;
//                                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithClass1 with Class {}
//                                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithClass2 = Object with Class;
//                                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithClass1 with Class {}
//                                          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithClass2 = Object with Class;
//                                                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithClass1 with Class {}
//                                                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithClass2 = Object with Class;
//                                                            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithClass1 with Class {}
//                                                             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithClass2 = Object with Class;
//                                                                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithClass1 with Class {}
//                                                     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithClass2 = Object with Class;
//                                                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithClass with Class {e1, e2}
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithClass1);
  print(ClassWithClass2);
  print(BaseClassWithClass1);
  print(BaseClassWithClass2);
  print(InterfaceClassWithClass1);
  print(InterfaceClassWithClass2);
  print(FinalClassWithClass1);
  print(FinalClassWithClass2);
  print(SealedClassWithClass1);
  print(SealedClassWithClass2);
  print(AbstractClassWithClass1);
  print(AbstractClassWithClass2);
  print(AbstractBaseClassWithClass1);
  print(AbstractBaseClassWithClass2);
  print(AbstractInterfaceClassWithClass1);
  print(AbstractInterfaceClassWithClass2);
  print(AbstractFinalClassWithClass1);
  print(AbstractFinalClassWithClass2);
  print(EnumWithClass);
}
