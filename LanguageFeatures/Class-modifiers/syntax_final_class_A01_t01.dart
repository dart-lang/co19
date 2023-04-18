// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that `final class` can be constructed and extended (by
/// `base/final/sealed`) inside the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class FinalClass {}

base class BaseClassExtendsFinalClass extends FinalClass {}

final class FinalClassExtendsFinalClass extends FinalClass {}

sealed class SealedClassExtendsFinalClass extends FinalClass {}

abstract base class AbstractBaseClassExtendsFinalClass extends FinalClass {}

abstract final class AbstractFinalClassExtendsFinalClass extends FinalClass {}

main() {
  FinalClass();

  print(BaseClassExtendsFinalClass);
  print(FinalClassExtendsFinalClass);
  print(SealedClassExtendsFinalClass);
  print(AbstractBaseClassExtendsFinalClass);
  print(AbstractFinalClassExtendsFinalClass);
}
