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
/// type alias of an `abstract base` superdeclaration in another library
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

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

class ExtendsBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsBaseMixinClass extends TypedefAbstractBaseMixinClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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

typedef LocalTypedefAbstractBaseClass = AbstractBaseClass;

class ExtendsLocalTypedefAbstractBaseClass extends LocalTypedefAbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
  print(ClassWithBaseMixinClass);
  print(InterfaceClassWithBaseMixinClass);
  print(AbstractClassWithBaseMixinClass);
  print(MixinOnBaseClass);
  print(MixinOnBaseMixinClass);
  print(ExtendsLocalTypedefAbstractBaseClass);
}
