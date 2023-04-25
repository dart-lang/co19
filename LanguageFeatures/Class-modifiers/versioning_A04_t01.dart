// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Going through a pre-feature library does not remove transitive
/// restrictions for code in post-feature libraries.
///
/// @description Checks that it is a compile-time error if a declaration from a
/// post-future library extends a platform library class marked `interface` and
/// the superinterface chain goes through a pre-feature library declaration
/// @author sgrekhov22@gmail.com

import "versioning_pre_feature_lib.dart";

class ExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsPreFeatureImplementsInterface extends PreFeatureImplementsInterface {}
//                                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                           ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                    ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                      ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                        ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                            ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                                     ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                                               ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}
//                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsPreFeatureImplementsInterface);
  print(BaseExtendsPreFeatureImplementsInterface);
  print(InterfaceExtendsPreFeatureImplementsInterface);
  print(FinalExtendsPreFeatureImplementsInterface);
  print(SealedExtendsPreFeatureImplementsInterface);
  print(AbstractExtendsPreFeatureImplementsInterface);
  print(AbstractBaseExtendsPreFeatureImplementsInterface);
  print(AbstractInterfaceExtendsPreFeatureImplementsInterface);
  print(AbstractFinalExtendsPreFeatureImplementsInterface);

  print(ExtendsPreFeatureWithInterface);
  print(BaseExtendsPreFeatureWithInterface);
  print(InterfaceExtendsPreFeatureWithInterface);
  print(FinalExtendsPreFeatureWithInterface);
  print(SealedExtendsPreFeatureWithInterface);
  print(AbstractExtendsPreFeatureWithInterface);
  print(AbstractBaseExtendsPreFeatureWithInterface);
  print(AbstractInterfaceExtendsPreFeatureWithInterface);
  print(AbstractFinalExtendsPreFeatureWithInterface);
}
