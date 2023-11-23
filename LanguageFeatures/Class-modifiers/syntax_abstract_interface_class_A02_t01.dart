// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if an
/// `abstract interface class` is extended outside of the library where it is
/// defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                               ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                        ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                                  ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                          ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                            ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                                                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsAbstractInterfaceClass extends AbstractInterfaceClass {}
//                                                                           ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsAbstractInterfaceClass);
  print(BaseClassExtendsAbstractInterfaceClass);
  print(InterfaceClassExtendsAbstractInterfaceClass);
  print(FinalClassExtendsAbstractInterfaceClass);
  print(SealedClassExtendsAbstractInterfaceClass);
  print(AbstractClassExtendsAbstractInterfaceClass);
  print(AbstractBaseClassExtendsAbstractInterfaceClass);
  print(AbstractInterfaceClassExtendsAbstractInterfaceClass);
  print(AbstractFinalClassExtendsAbstractInterfaceClass);
}
