// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is a compile-time error if a class from a
/// pre-future library extends or mixes in a declaration marked `interface` or
/// `final` from a post-feature library
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

class ExtendsInterface extends InterfaceClass {}
//                             ^^^^^^^^^^^^^^
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

class ExtendsAbstractInterface extends AbstractInterfaceClass {}
//                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractInterface1 with AbstractInterfaceClass {}
//                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractInterface2 = Object with AbstractInterfaceClass;
//                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsFinal extends FinalClass {}
//                         ^^^^^^^^^^
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

class ExtendsAbstractFinal extends AbstractFinalClass {}
//                                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractFinal1 with AbstractFinalClass {}
//                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractFinal2 = Object with AbstractFinalClass;
//                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsInterface);
  print(WithInterface1);
  print(WithInterface2);
  print(ExtendsAbstractInterface);
  print(WithAbstractInterface1);
  print(WithAbstractInterface2);
  print(ExtendsFinal);
  print(WithFinal1);
  print(WithFinal2);
  print(ExtendsAbstractFinal);
  print(WithAbstractFinal1);
  print(WithAbstractFinal2);
}
