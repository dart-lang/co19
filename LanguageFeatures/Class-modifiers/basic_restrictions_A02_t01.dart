// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is a compile-time error if class marked
/// `interface` is extended outside of the library where it is declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsInterface extends InterfaceClass {}
//                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsInterface extends InterfaceClass {}
//                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsInterface extends InterfaceClass {}
//                                                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsInterface extends InterfaceClass {}
//                                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsInterface extends InterfaceClass {}
//                                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsInterface extends InterfaceClass {}
//                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsInterface extends InterfaceClass {}
//                                                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsInterface extends InterfaceClass {}
//                                                                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsInterface extends InterfaceClass {}
//                                                         ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassExtendsInterface extends InterfaceClass {}
//                                             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassExtendsInterface extends InterfaceClass {}
//                                                      ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsInterface extends InterfaceClass {}
//                                                              ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassExtendsInterface extends InterfaceClass {}
//                                                                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsInterface);
  print(BaseExtendsInterface);
  print(InterfaceExtendsInterface);
  print(FinalExtendsInterface);
  print(SealedExtendsInterface);
  print(AbstractExtendsInterface);
  print(AbstractBaseExtendsInterface);
  print(AbstractInterfaceExtendsInterface);
  print(AbstractFinalExtendsInterface);
  print(MixinClassExtendsInterface);
  print(BaseMixinClassExtendsInterface);
  print(AbstractMixinClassExtendsInterface);
  print(AbstractBaseMixinClassExtendsInterface);
}
