// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is a compile-time error if a declaration is not
/// `base`, `final` or `sealed` and has a superdeclaration marked `base`. Test
/// `base` superdeclaration in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base class BaseClass {}
base mixin BaseMixin {}
base mixin class BaseMixinClass {}

class ExtendsBaseClass extends BaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsBaseClass extends BaseClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseClass extends BaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsBaseClass extends BaseClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsBaseClass implements BaseClass {}
//    ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseClass implements BaseClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseClass implements BaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsBaseClass implements BaseClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseMixin with BaseMixin {}
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseMixinClass with BaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithBaseMixin with BaseMixin {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithBaseMixinClass with BaseMixinClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithBaseMixin with BaseMixin {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithBaseMixinClass with BaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithBaseMixin with BaseMixin {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithBaseMixinClass with BaseMixinClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseClass on BaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseMixinClass on BaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseClass implements BaseClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixinClass implements BaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseClass implements BaseClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseClass implements BaseClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsBaseClass implements BaseClass {e1, e2}
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithBaseMixin with BaseMixin {e1, e2}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithBaseMixinClass with BaseMixinClass {e1, e2}
//                               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsBaseClass);
  print(InterfaceExtendsBaseClass);
  print(AbstractExtendsBaseClass);
  print(AbstractInterfaceExtendsBaseClass);
  print(ImplementsBaseClass);
  print(InterfaceImplementsBaseClass);
  print(AbstractImplementsBaseClass);
  print(AbstractInterfaceImplementsBaseClass);
  print(ClassWithBaseMixin);
  print(ClassWithBaseMixinClass);
  print(InterfaceClassWithBaseMixin);
  print(InterfaceClassWithBaseMixinClass);
  print(AbstractClassWithBaseMixin);
  print(AbstractClassWithBaseMixinClass);
  print(MixinOnBaseClass);
  print(MixinOnBaseMixinClass);
  print(MixinImplementsBaseClass);
  print(MixinImplementsBaseMixinClass);
  print(MixinClassImplementsBaseClass);
  print(MixinClassImplementsBaseMixinClass);
  print(AbstractMixinClassImplementsBaseClass);
  print(AbstractMixinClassImplementsBaseMixinClass);
  print(EnumImplementsBaseClass);
  print(EnumWithBaseMixin);
  print(EnumWithBaseMixinClass);
}
