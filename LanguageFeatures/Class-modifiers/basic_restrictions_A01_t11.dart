// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is a compile-time error to mix in or use in the
/// `on` clause of a mixin a class marked `sealed` outside of the library where
/// it is declared. Test type aliases
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

mixin MixinOnSealed on TypedefSealedClass {}
//                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixinOnSealed on TypedefSealedClass {}
//                              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithSealed with TypedefSealedClass {}
//                         ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassWithSealed with TypedefSealedClass {}
//                                  ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassWithSealed with TypedefSealedClass {}
//                                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassWithSealed with TypedefSealedClass {}
//                                    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassWithSealed with TypedefSealedClass {}
//                                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassWithSealed with TypedefSealedClass {}
//                                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassWithSealed with TypedefSealedClass {}
//                                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassWithSealed with TypedefSealedClass {}
//                                                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassWithSealed with TypedefSealedClass {}
//                                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumWithSealedClass with TypedefSealedClass {e1, e2}
//                            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefSealedClass = SealedClass;

mixin MixinOnLocalTypedefSealedClass on LocalTypedefSealedClass {}
//                                      ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassWithLocalTypedefSealedClass with LocalTypedefSealedClass {}
//                                          ^^^^^^^^^^^^^^^^^^^^^^^
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
  print(MixinOnLocalTypedefSealedClass);
  print(ClassWithLocalTypedefSealedClass);
}
