// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is a compile-time error if a declaration from a
/// pre-feature library mixes in a declaration not marked `mixin` from a
/// post-feature library
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

class ClassWithClass1 with Class {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithClass2 = Object with Class;
//                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseClass1 with BaseClass {}
//                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseClass2 = Object with BaseClass;
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithInterface1 with InterfaceClass {}
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithInterface2 = Object with InterfaceClass;
//                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithFinal1 with FinalClass {}
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithFinal2 = Object with FinalClass;
//                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithSealed1 with SealedClass {}
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithSealed2 = Object with SealedClass;
//                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractClass1 with AbstractClass {}
//                            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractClass2 = Object with AbstractClass;
//                                     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractBaseClass1 with AbstractBaseClass {}
//                                ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractBaseClass2 = Object with AbstractBaseClass;
//                                         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractInterfaceClass1 with AbstractInterfaceClass {}
//                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractInterfaceClass2 = Object with AbstractInterfaceClass;
//                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractFinalClass1 with AbstractFinalClass {}
//                                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractFinalClass2 = Object with AbstractFinalClass;
//                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassWithClass1);
  print(ClassWithClass2);
  print(ClassWithBaseClass1);
  print(ClassWithBaseClass2);
  print(WithInterface1);
  print(WithInterface2);
  print(WithFinal1);
  print(WithFinal2);
  print(WithSealed1);
  print(WithSealed2);
  print(WithAbstractClass1);
  print(WithAbstractClass2);
  print(WithAbstractBaseClass1);
  print(WithAbstractBaseClass2);
  print(WithAbstractInterfaceClass1);
  print(WithAbstractInterfaceClass2);
  print(WithAbstractFinalClass1);
  print(WithAbstractFinalClass2);
}
