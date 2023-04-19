// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interface class can be constructed and implemented but not
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error if `interface class`
/// is extended outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassExtendsInterfaceClass extends InterfaceClass {}
//                                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassExtendsInterfaceClass extends InterfaceClass {}
//                                                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsInterfaceClass extends InterfaceClass {}
//                                                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsInterfaceClass extends InterfaceClass {}
//                                                  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsInterfaceClass extends InterfaceClass {}
//                                                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsInterfaceClass extends InterfaceClass {}
//                                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsInterfaceClass extends InterfaceClass {}
//                                                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsInterfaceClass extends InterfaceClass {}
//                                                                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsInterfaceClass extends InterfaceClass {}
//                                                                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsInterfaceClass);
  print(BaseClassExtendsInterfaceClass);
  print(InterfaceClassExtendsInterfaceClass);
  print(FinalClassExtendsInterfaceClass);
  print(SealedClassExtendsInterfaceClass);
  print(AbstractClassExtendsInterfaceClass);
  print(AbstractBaseClassExtendsInterfaceClass);
  print(AbstractInterfaceClassExtendsInterfaceClass);
  print(AbstractFinalClassExtendsInterfaceClass);
}
