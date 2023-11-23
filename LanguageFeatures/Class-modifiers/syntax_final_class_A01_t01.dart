// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that `final class` can be constructed but not extended
/// (by `base/final/sealed`) outside of the library where it is defined
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class BaseClassExtendsFinalClass extends FinalClass {}
//                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsFinalClass extends FinalClass {}
//                                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsFinalClass extends FinalClass {}
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsFinalClass extends FinalClass {}
//                                                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsFinalClass extends FinalClass {}
//                                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  FinalClass(); // no error

  print(BaseClassExtendsFinalClass);
  print(FinalClassExtendsFinalClass);
  print(SealedClassExtendsFinalClass);
  print(AbstractBaseClassExtendsFinalClass);
  print(AbstractFinalClassExtendsFinalClass);
}
