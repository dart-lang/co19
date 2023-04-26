// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is a compile-time error if a declaration from a
/// pre-feature library implements a declaration marked `base` or `final` from a
/// post-feature library
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

class ImplementsBase implements BaseClass {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsAbstractBase implements AbstractBaseClass {}
//                                      ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsBaseMixinClass implements BaseMixinClass {}
//                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsBaseMixin implements BaseMixin {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBase implements BaseClass {}
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsAbstractBase implements AbstractBaseClass {}
//                                                       ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseMixinClass implements BaseMixinClass {}
//                                                         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseMixin implements BaseMixin {}
//                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified


class ImplementsFinal implements FinalClass {}
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsAbstractFinal implements AbstractFinalClass {}
//                                       ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsFinal implements FinalClass {}
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsAbstractFinal implements AbstractFinalClass {}
//                                                        ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBase implements BaseClass {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractBase implements AbstractBaseClass {}
//                                           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixinClass implements BaseMixinClass {}
//                                             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixin implements BaseMixin {}
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsFinal implements FinalClass {}
//                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractFinal implements AbstractFinalClass {}
//                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBase on BaseClass {}
//    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnAbstractBase on AbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseMixinClass on BaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnAbstractBaseMixinClass on AbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseMixin on BaseMixin {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnFinal on FinalClass {}
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnAbstractFinal on AbstractFinalClass {}
//                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified


enum EnumImplementsBase implements BaseClass {e1, e2}
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsAbstractBase implements AbstractBaseClass {e1, e2}
//                                         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseMixinClass implements BaseMixinClass {e1, e2}
//                                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {e1, e2}
//                                                   ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseMixin implements BaseMixin {e1, e2}
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsFinal implements FinalClass {e1, e2}
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsAbstractFinal implements AbstractFinalClass {e1, e2}
//                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsBase);
  print(ImplementsAbstractBase);
  print(ImplementsBaseMixinClass);
  print(ImplementsAbstractBaseMixinClass);
  print(ImplementsBaseMixin);
  print(AbstractImplementsBase);
  print(AbstractImplementsAbstractBase);
  print(AbstractImplementsBaseMixinClass);
  print(AbstractImplementsAbstractBaseMixinClass);
  print(AbstractImplementsBaseMixin);
  print(ImplementsFinal);
  print(ImplementsAbstractFinal);
  print(AbstractImplementsFinal);
  print(AbstractImplementsAbstractFinal);
  print(MixinImplementsBase);
  print(MixinImplementsAbstractBase);
  print(MixinImplementsBaseMixinClass);
  print(MixinImplementsAbstractBaseMixinClass);
  print(MixinImplementsBaseMixin);
  print(MixinImplementsFinal);
  print(MixinImplementsAbstractFinal);
  print(MixinOnBase);
  print(MixinOnAbstractBase);
  print(MixinOnBaseMixinClass);
  print(MixinOnAbstractBaseMixinClass);
  print(MixinOnBaseMixin);
  print(MixinOnFinal);
  print(MixinOnAbstractFinal);
  print(EnumImplementsBase);
  print(EnumImplementsAbstractBase);
  print(EnumImplementsBaseMixinClass);
  print(EnumImplementsAbstractBaseMixinClass);
  print(EnumImplementsBaseMixin);
  print(EnumImplementsFinal);
  print(EnumImplementsAbstractFinal);
}
