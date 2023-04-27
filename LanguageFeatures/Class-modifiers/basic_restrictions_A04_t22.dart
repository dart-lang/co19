// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is a compile-time error if a declaration is not
/// `base`, `final` or `sealed` and has a superdeclaration marked `base`. Test a
/// type alias of an `abstract base` superdeclaration in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract base class AbstractBaseClass {}
abstract base mixin class AbstractBaseMixinClass {}

typedef TypedefAbstractBaseClass = AbstractBaseClass;
typedef TypedefAbstractBaseMixinClass = AbstractBaseMixinClass;

class ExtendsBaseClass extends TypedefAbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsBaseClass extends TypedefAbstractBaseClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseClass extends TypedefAbstractBaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsBaseClass extends TypedefAbstractBaseClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsAbstractBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsAbstractBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsAbstractBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsAbstractBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsBaseClass implements TypedefAbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseClass implements TypedefAbstractBaseClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseClass implements TypedefAbstractBaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsBaseClass implements TypedefAbstractBaseClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseMixinClass with TypedefAbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithBaseMixinClass with TypedefAbstractBaseMixinClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithBaseMixinClass with TypedefAbstractBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithBaseMixinClass with TypedefAbstractBaseMixinClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseClass on TypedefAbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseMixinClass on TypedefAbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseClass implements TypedefAbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixinClass implements TypedefAbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseClass implements TypedefAbstractBaseClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixinClass implements TypedefAbstractBaseMixinClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseClass implements TypedefAbstractBaseClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixinClass implements TypedefAbstractBaseMixinClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsBaseClass);
  print(InterfaceExtendsBaseClass);
  print(AbstractExtendsBaseClass);
  print(AbstractInterfaceExtendsBaseClass);
  print(ExtendsAbstractBaseMixinClass);
  print(InterfaceExtendsAbstractBaseMixinClass);
  print(AbstractExtendsAbstractBaseMixinClass);
  print(AbstractInterfaceExtendsAbstractBaseMixinClass);
  print(ImplementsBaseClass);
  print(InterfaceImplementsBaseClass);
  print(AbstractImplementsBaseClass);
  print(AbstractInterfaceImplementsBaseClass);
  print(ClassWithBaseMixinClass);
  print(InterfaceClassWithBaseMixinClass);
  print(AbstractClassWithBaseMixinClass);
  print(MixinOnBaseClass);
  print(MixinOnBaseMixinClass);
  print(MixinImplementsBaseClass);
  print(MixinImplementsBaseMixinClass);
  print(MixinClassImplementsBaseClass);
  print(MixinClassImplementsBaseMixinClass);
  print(AbstractMixinClassImplementsBaseClass);
  print(AbstractMixinClassImplementsBaseMixinClass);
}
