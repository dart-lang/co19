// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is a compile-time error if a class declaration
/// from a pre-feature library has a superdeclaration marked `base` in a
/// post-feature library
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

class ExtendsBaseClass extends BaseClass {}
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsAbstractBaseClass extends AbstractBaseClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsBaseMixinClass extends BaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsAbstractBaseMixinClass extends AbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseClass extends BaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsAbstractBaseClass extends AbstractBaseClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsBaseMixinClass extends BaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsAbstractBaseMixinClass extends AbstractBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithBaseMixinClass with BaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithAbstractBaseMixinClass with AbstractBaseMixinClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class WithBaseMixin with BaseMixin {}
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithBaseMixinClass with BaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithAbstractBaseMixinClass with AbstractBaseMixinClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithBaseMixin with BaseMixin {}
//             ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsBaseClass);
  print(ExtendsAbstractBaseClass);
  print(ExtendsBaseMixinClass);
  print(ExtendsAbstractBaseMixinClass);
  print(AbstractExtendsBaseClass);
  print(AbstractExtendsAbstractBaseClass);
  print(AbstractExtendsBaseMixinClass);
  print(AbstractExtendsAbstractBaseMixinClass);
  print(WithBaseMixinClass);
  print(WithAbstractBaseMixinClass);
  print(WithBaseMixin);
  print(AbstractWithBaseMixinClass);
  print(AbstractWithAbstractBaseMixinClass);
  print(AbstractWithBaseMixin);
}
