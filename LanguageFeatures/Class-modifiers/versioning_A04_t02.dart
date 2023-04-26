// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Going through a pre-feature library does not remove transitive
/// restrictions for code in post-feature libraries.
///
/// @description Checks that it is not an error if a declaration from a
/// post-feature library mixes in a platform library class marked `interface`
/// (restrictions associated with `interface` aren't transitive)
/// @author sgrekhov22@gmail.com

import "versioning_pre_feature_lib.dart";

class WithPreFeatureImplementsInterface with PreFeatureImplementsInterface {}

base class BaseWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

interface class InterfaceWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

final class FinalWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

sealed class SealedWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

abstract class AbstractWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

abstract base class AbstractBaseWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

abstract interface class AbstractInterfaceWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

abstract final class AbstractFinalWithPreFeatureImplementsInterface
    with PreFeatureImplementsInterface {}

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
