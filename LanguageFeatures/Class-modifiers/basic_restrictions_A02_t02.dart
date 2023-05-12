// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is a compile-time error if class marked
/// `abstract interface` is extended outside of the library where it is declared
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ExtendsInterface extends AbstractInterfaceClass {}
//                             ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsInterface extends AbstractInterfaceClass {}
//                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsInterface extends AbstractInterfaceClass {}
//                                                ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsInterface extends AbstractInterfaceClass {}
//                                        ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsInterface extends AbstractInterfaceClass {}
//                                          ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsInterface extends AbstractInterfaceClass {}
//                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsInterface extends AbstractInterfaceClass {}
//                                                       ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsInterface extends AbstractInterfaceClass {}
//                                                                 ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsInterface extends AbstractInterfaceClass {}
//                                                         ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassExtendsInterface extends AbstractInterfaceClass {}
//                                             ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassExtendsInterface extends AbstractInterfaceClass {}
//                                                      ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsInterface extends AbstractInterfaceClass {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassExtendsInterface extends AbstractInterfaceClass {}
//                                                                       ^^^^^^^^^^^^^^^^^^^^^^
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
