// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is no an error if `sealed class` is extended
/// inside the same library where it is defined
/// @author sgrekhov22@gmail.com

sealed class SealedClass {}

class ClassExtendsSealedClass extends SealedClass {}

base class BaseClassExtendsSealedClass extends SealedClass {}

interface class InterfaceClassExtendsSealedClass extends SealedClass {}

final class FinalClassExtendsSealedClass extends SealedClass {}

sealed class SealedClassExtendsSealedClass extends SealedClass {}

abstract class AbstractClassExtendsSealedClass extends SealedClass {}

abstract base class AbstractBaseClassExtendsSealedClass extends SealedClass {}

abstract interface class AbstractInterfaceClassExtendsSealedClass
    extends SealedClass {}

abstract final class AbstractFinalClassExtendsSealedClass extends SealedClass {}

main() {
  print(ClassExtendsSealedClass);
  print(BaseClassExtendsSealedClass);
  print(InterfaceClassExtendsSealedClass);
  print(FinalClassExtendsSealedClass);
  print(SealedClassExtendsSealedClass);
  print(AbstractClassExtendsSealedClass);
  print(AbstractBaseClassExtendsSealedClass);
  print(AbstractInterfaceClassExtendsSealedClass);
  print(AbstractFinalClassExtendsSealedClass);
}
