// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is a compile-time error to mix in or use in the
/// `on` clause of a mixin a class marked `sealed` outside of the library where
/// it is declared
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

mixin MixinOnSealed on SealedClass {}
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinOnSealed on SealedClass {}
//                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithSealed with SealedClass {}
//                         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithSealed with SealedClass {}
//                                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithSealed with SealedClass {}
//                                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithSealed with SealedClass {}
//                                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithSealed with SealedClass {}
//                                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithSealed with SealedClass {}
//                                          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithSealed with SealedClass {}
//                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithSealed with SealedClass {}
//                                                             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithSealed with SealedClass {}
//                                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithSealedClass with SealedClass {e1, e2}
//                            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MixinOnSealed);
  print(BaseMixinOnSealed);
  print(ClassWithSealed);
  print(BaseClassWithSealed);
  print(InterfaceClassWithSealed);
  print(FinalClassWithSealed);
  print(SealedClassWithSealed);
  print(AbstractClassWithSealed);
  print(AbstractBaseClassWithSealed);
  print(AbstractInterfaceClassWithSealed);
  print(AbstractFinalClassWithSealed);
  print(EnumWithSealedClass);
}
