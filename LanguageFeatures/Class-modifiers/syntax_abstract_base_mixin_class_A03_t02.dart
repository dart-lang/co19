// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement a
/// `abstract base mixin class` by not `base/final/sealed` in the same library
/// where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract base mixin class AbstractBaseMixinClass {}

class ClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                        ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {}
//                                                     ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsAbstractBaseMixinClass);
  print(InterfaceClassImplementsAbstractBaseMixinClass);
  print(AbstractClassImplementsAbstractBaseMixinClass);
  print(AbstractInterfaceClassImplementsAbstractBaseMixinClass);
  print(MixinClassImplementsAbstractBaseMixinClass);
  print(AbstractMixinClassImplementsAbstractBaseMixinClass);
  print(MixinImplementsAbstractBaseMixinClass);
}
