// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that it is not an error if a `base class` is
/// implemented in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base class LocalBaseClass {}

base class BaseClassImplementsLocalBaseClass implements LocalBaseClass {}

final class FinalClassImplementsLocalBaseClass implements LocalBaseClass {}

sealed class SealedClassImplementsLocalBaseClass implements LocalBaseClass {}

abstract base class AbstractBaseClassImplementsLocalBaseClass
    implements LocalBaseClass {}

abstract final class AbstractFinalClassImplementsLocalBaseClass
    implements LocalBaseClass {}

main() {
  print(BaseClassImplementsLocalBaseClass);
  print(FinalClassImplementsLocalBaseClass);
  print(SealedClassImplementsLocalBaseClass);
  print(AbstractBaseClassImplementsLocalBaseClass);
  print(AbstractFinalClassImplementsLocalBaseClass);
}
