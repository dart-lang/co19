// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Going through a pre-feature library does not remove transitive
/// restrictions for code in post-feature libraries.
///
/// @description Checks that it is a compile-time error if a declaration from a
/// post-future library mixes in a platform library class marked `interface` and
/// the superinterface chain goes through a pre-feature library declaration
/// @author sgrekhov22@gmail.com

import "versioning_pre_feature_lib.dart";

class WithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalWithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}
//                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(WithPreFeatureImplementsInterface);
  print(BaseWithPreFeatureImplementsInterface);
  print(InterfaceWithPreFeatureImplementsInterface);
  print(FinalWithPreFeatureImplementsInterface);
  print(SealedWithPreFeatureImplementsInterface);
  print(AbstractWithPreFeatureImplementsInterface);
  print(AbstractBaseWithPreFeatureImplementsInterface);
  print(AbstractInterfaceWithPreFeatureImplementsInterface);
  print(AbstractFinalWithPreFeatureImplementsInterface);
}
