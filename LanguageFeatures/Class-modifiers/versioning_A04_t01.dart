// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Going through a pre-feature library does not remove transitive
/// restrictions for code in post-feature libraries.
///
/// @description Checks that it is not an error if a declaration from a
/// post-feature library extends a platform library class marked `interface`
/// (restrictions associated with `interface` aren't transitive).
/// @author sgrekhov22@gmail.com

import "versioning_pre_feature_lib.dart";

class ExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

base class BaseExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

interface class InterfaceExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

final class FinalExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

sealed class SealedExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

abstract class AbstractExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

abstract base class AbstractBaseExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

abstract interface class AbstractInterfaceExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

abstract final class AbstractFinalExtendsPreFeatureImplementsInterface
    extends PreFeatureImplementsInterface {}

class ExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}

base class BaseExtendsPreFeatureWithInterface extends PreFeatureWithInterface {}

interface class InterfaceExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

final class FinalExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

sealed class SealedExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

abstract class AbstractExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

abstract base class AbstractBaseExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

abstract interface class AbstractInterfaceExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

abstract final class AbstractFinalExtendsPreFeatureWithInterface
    extends PreFeatureWithInterface {}

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
