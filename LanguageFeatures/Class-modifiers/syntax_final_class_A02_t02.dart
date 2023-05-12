// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that `final class` can be implemented (by
/// `base/final/sealed`) inside the same library where it is defined
/// @author sgrekhov22@gmail.com

final class FinalClass {}

base class BaseClassImplementsFinalClass implements FinalClass {}

final class FinalClassImplementsFinalClass implements FinalClass {}

sealed class SealedClassImplementsFinalClass implements FinalClass {}

abstract base class AbstractBaseClassImplementsFinalClass
    implements FinalClass {}

abstract final class AbstractFinalClassImplementsFinalClass
    implements FinalClass {}

enum EnumImplementsFinalClass implements FinalClass {e1, e2}

main() {
  print(BaseClassImplementsFinalClass);
  print(FinalClassImplementsFinalClass);
  print(SealedClassImplementsFinalClass);
  print(AbstractBaseClassImplementsFinalClass);
  print(AbstractFinalClassImplementsFinalClass);
  print(EnumImplementsFinalClass);
}
