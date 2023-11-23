// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement
/// `abstract final class` in the same library where it is defined by a class
/// without `base/final/sealed` modifier
/// @author sgrekhov22@gmail.com

abstract final class AbstractFinalClass {}

class ImplementsAbstractFinalClass implements AbstractFinalClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsAbstractFinalClass implements AbstractFinalClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsAbstractFinalClass implements AbstractFinalClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsAbstractFinalClass implements AbstractFinalClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsAbstractFinalClass implements AbstractFinalClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsAbstractFinalClass implements AbstractFinalClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractFinalClass implements AbstractFinalClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsAbstractFinalClass);
  print(InterfaceImplementsAbstractFinalClass);
  print(AbstractImplementsAbstractFinalClass);
  print(AbstractInterfaceImplementsAbstractFinalClass);
  print(MixinClassImplementsAbstractFinalClass);
  print(AbstractMixinClassImplementsAbstractFinalClass);
  print(MixinImplementsAbstractFinalClass);
}
