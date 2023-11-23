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
/// a type alias of a `base` superdeclaration in another library
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ExtendsBaseClass extends TypedefBaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsBaseClass extends TypedefBaseClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseClass extends TypedefBaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsBaseClass extends TypedefBaseClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsBaseMixinClass extends TypedefBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsBaseMixinClass extends TypedefBaseMixinClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseMixinClass extends TypedefBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsBaseMixinClass extends TypedefBaseMixinClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseMixin with TypedefBaseMixin {}
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithBaseMixinClass with TypedefBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithBaseMixin with TypedefBaseMixin {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithBaseMixinClass with TypedefBaseMixinClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithBaseMixin with TypedefBaseMixin {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithBaseMixinClass with TypedefBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithBaseMixin with TypedefBaseMixin {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithBaseMixinClass with TypedefBaseMixinClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseClass on TypedefBaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseMixin on TypedefBaseMixin {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnBaseMixinClass on TypedefBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefBaseClass = BaseClass;

class ExtendsLocalTypedefBaseClass extends LocalTypedefBaseClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsBaseClass);
  print(InterfaceExtendsBaseClass);
  print(AbstractExtendsBaseClass);
  print(AbstractInterfaceExtendsBaseClass);
  print(ExtendsBaseMixinClass);
  print(InterfaceExtendsBaseMixinClass);
  print(AbstractExtendsBaseMixinClass);
  print(AbstractInterfaceExtendsBaseMixinClass);
  print(ClassWithBaseMixin);
  print(ClassWithBaseMixinClass);
  print(InterfaceClassWithBaseMixin);
  print(InterfaceClassWithBaseMixinClass);
  print(AbstractClassWithBaseMixin);
  print(AbstractClassWithBaseMixinClass);
  print(MixinOnBaseClass);
  print(MixinOnBaseMixin);
  print(MixinOnBaseMixinClass);
  print(ExtendsLocalTypedefBaseClass);
}
