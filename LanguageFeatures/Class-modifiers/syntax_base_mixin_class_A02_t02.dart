// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin class can be constructed, extended and mixed in but
/// not implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement a
/// `base mixin class` by not `base/final/sealed` in the same library where it
/// is defined
/// @author sgrekhov22@gmail.com

base mixin class BaseMixinClass {}

class ClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixinClass implements BaseMixinClass {}
//                                                                         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixinClass implements BaseMixinClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsBaseMixinClass);
  print(InterfaceClassImplementsBaseMixinClass);
  print(AbstractClassImplementsBaseMixinClass);
  print(AbstractInterfaceClassImplementsBaseMixinClass);
  print(MixinClassImplementsBaseMixinClass);
  print(AbstractMixinClassImplementsBaseMixinClass);
  print(MixinImplementsBaseMixinClass);
}
