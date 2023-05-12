// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is a compile-time error if class marked `sealed`
/// is extended outside of the library where it is declared. Test type aliases
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ExtendsSealed extends TypedefSealedClass {}
//                          ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsSealed extends TypedefSealedClass {}
//                                   ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsSealed extends TypedefSealedClass {}
//                                             ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsSealed extends TypedefSealedClass {}
//                                     ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsSealed extends TypedefSealedClass {}
//                                       ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsSealed extends TypedefSealedClass {}
//                                           ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsSealed extends TypedefSealedClass {}
//                                                    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsSealed extends TypedefSealedClass {}
//                                                              ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsSealed extends TypedefSealedClass {}
//                                                      ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefSealedClass = SealedClass;

class ExtendsLocalTypedefSealedClass extends LocalTypedefSealedClass {}
//                                           ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsSealed);
  print(AbstractExtendsSealed);
  print(AbstractBaseExtendsSealed);
  print(AbstractInterfaceExtendsSealed);
  print(AbstractFinalExtendsSealed);
  print(FinalExtendsSealed);
  print(BaseExtendsSealed);
  print(SealedExtendsSealed);
  print(InterfaceExtendsSealed);
  print(ExtendsLocalTypedefSealedClass);
}
