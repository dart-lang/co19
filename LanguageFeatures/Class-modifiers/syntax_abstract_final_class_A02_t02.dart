// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to extend
/// `abstract final class` in the same library where it is defined by a class
/// without `base/final/sealed` modifier
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract final class AbstractFinalClass {}

class ExtendsAbstractFinalClass extends AbstractFinalClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsAbstractFinalClass extends AbstractFinalClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsAbstractFinalClass extends AbstractFinalClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsAbstractFinalClass extends AbstractFinalClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassExtendsAbstractFinalClass extends AbstractFinalClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsAbstractFinalClass extends AbstractFinalClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsAbstractFinalClass);
  print(InterfaceExtendsAbstractFinalClass);
  print(AbstractExtendsAbstractFinalClass);
  print(AbstractInterfaceExtendsAbstractFinalClass);
  print(MixinClassExtendsAbstractFinalClass);
  print(AbstractMixinClassExtendsAbstractFinalClass);
}
