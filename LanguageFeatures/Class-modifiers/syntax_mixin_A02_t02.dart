// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin can be implemented and mixed in but not constructed or
/// extended and is not exhaustive
///
/// @description Checks that it is a compile-time error to construct a `mixin`
/// in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

mixin Mixin {}

class ClassExtendsMixin extends Mixin {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassExtendsMixin extends Mixin {}
//                                       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsMixin extends Mixin {}
//                                                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsMixin extends Mixin {}
//                                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsMixin extends Mixin {}
//                                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsMixin extends Mixin {}
//                                               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsMixin extends Mixin {}
//                                                        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsMixin extends Mixin {}
//                                                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsMixin extends Mixin {}
//                                                          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsMixin);
  print(BaseClassExtendsMixin);
  print(InterfaceClassExtendsMixin);
  print(FinalClassExtendsMixin);
  print(SealedClassExtendsMixin);
  print(AbstractClassExtendsMixin);
  print(AbstractBaseClassExtendsMixin);
  print(AbstractInterfaceClassExtendsMixin);
  print(AbstractFinalClassExtendsMixin);
}
