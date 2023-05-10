// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is a compile-time error to implement the
/// interface of a class marked `sealed` outside of the library where it is
/// declared. Test type aliases
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ImplementsSealed implements TypedefSealedClass {}
//                                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsSealed implements TypedefSealedClass {}
//                                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsSealed implements TypedefSealedClass {}
//                                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsSealed implements TypedefSealedClass {}
//                                           ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsSealed implements TypedefSealedClass {}
//                                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsSealed implements TypedefSealedClass {}
//                                                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseImplementsSealed implements TypedefSealedClass {}
//                                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsSealed implements TypedefSealedClass {}
//                                                                    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalImplementsSealed implements TypedefSealedClass {}
//                                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsSealed implements TypedefSealedClass {}
//                                                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassImplementsSealed implements TypedefSealedClass {}
//                                                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinImplementsSealed implements TypedefSealedClass {}
//                                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinImplementsSealed implements TypedefSealedClass {}
//                                                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsSealed implements TypedefSealedClass {}
//                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinImplementsSealed implements TypedefSealedClass {}
//                                              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsSealedClass implements TypedefSealedClass {e1, e2}
//                                        ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefSealedClass = SealedClass;

class ImplementsLocalTypedefSealedClass implements LocalTypedefSealedClass {}
//                                                 ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsSealed);
  print(AbstractImplementsSealed);
  print(AbstractBaseImplementsSealed);
  print(AbstractInterfaceImplementsSealed);
  print(AbstractFinalImplementsSealed);
  print(FinalImplementsSealed);
  print(BaseImplementsSealed);
  print(SealedImplementsSealed);
  print(InterfaceImplementsSealed);
  print(MixinClassImplementsSealed);
  print(BaseMixinClassImplementsSealed);
  print(AbstractMixinImplementsSealed);
  print(AbstractBaseMixinImplementsSealed);
  print(MixinImplementsSealed);
  print(BaseMixinImplementsSealed);
  print(EnumImplementsSealedClass);
  print(ImplementsLocalTypedefSealedClass);
}
