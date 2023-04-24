// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that `final class` cannot be implemented
/// (by `base/final/sealed`) outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class BaseClassImplementsFinalClass implements FinalClass {}
//                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassImplementsFinalClass implements FinalClass {}
//                                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassImplementsFinalClass implements FinalClass {}
//                                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassImplementsFinalClass implements FinalClass {}
//                                                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassImplementsFinalClass implements FinalClass {}
//                                                                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumImplementsFinalClass implements FinalClass {e1, e2}
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClassImplementsFinalClass);
  print(FinalClassImplementsFinalClass);
  print(SealedClassImplementsFinalClass);
  print(AbstractBaseClassImplementsFinalClass);
  print(AbstractFinalClassImplementsFinalClass);
  print(EnumImplementsFinalClass);
}
