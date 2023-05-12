// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is a compile-time error if `sealed class` is
/// extended outside of the library where it is defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ClassExtendsSealedClass extends SealedClass {}
//                                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassExtendsSealedClass extends SealedClass {}
//                                             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsSealedClass extends SealedClass {}
//                                                       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsSealedClass extends SealedClass {}
//                                               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsSealedClass extends SealedClass {}
//                                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsSealedClass extends SealedClass {}
//                                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsSealedClass extends SealedClass {}
//                                                              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsSealedClass extends SealedClass {}
//                                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsSealedClass extends SealedClass {}
//                                                                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsSealedClass);
  print(BaseClassExtendsSealedClass);
  print(InterfaceClassExtendsSealedClass);
  print(FinalClassExtendsSealedClass);
  print(SealedClassExtendsSealedClass);
  print(AbstractClassExtendsSealedClass);
  print(AbstractBaseClassExtendsSealedClass);
  print(AbstractInterfaceClassExtendsSealedClass);
  print(AbstractFinalClassExtendsSealedClass);
}
