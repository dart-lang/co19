// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is a compile-time error if class marked
/// `abstract final` is extended outside of the library where it is declared
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ExtendsFinal extends AbstractFinalClass {}
//                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsFinal extends AbstractFinalClass {}
//                                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsFinal extends AbstractFinalClass {}
//                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsFinal extends AbstractFinalClass {}
//                                    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsFinal extends AbstractFinalClass {}
//                                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsFinal extends AbstractFinalClass {}
//                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsFinal extends AbstractFinalClass {}
//                                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsFinal extends AbstractFinalClass {}
//                                                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsFinal extends AbstractFinalClass {}
//                                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassExtendsFinal extends AbstractFinalClass {}
//                                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassExtendsFinal extends AbstractFinalClass {}
//                                                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsFinal extends AbstractFinalClass {}
//                                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassExtendsFinal extends AbstractFinalClass {}
//                                                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsFinal);
  print(BaseExtendsFinal);
  print(InterfaceExtendsFinal);
  print(FinalExtendsFinal);
  print(SealedExtendsFinal);
  print(AbstractExtendsFinal);
  print(AbstractBaseExtendsFinal);
  print(AbstractInterfaceExtendsFinal);
  print(AbstractFinalExtendsFinal);
  print(MixinClassExtendsFinal);
  print(BaseMixinClassExtendsFinal);
  print(AbstractMixinClassExtendsFinal);
  print(AbstractBaseMixinClassExtendsFinal);
}
