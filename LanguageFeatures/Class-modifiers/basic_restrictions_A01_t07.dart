// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is no error if a declaration directly extends or
/// declares mixin on a `sealed` declaration from the same library
/// @author sgrekhov22@gmail.com

sealed class SealedClass {}

class ClassExtendsSealedClass extends SealedClass {}

base class BaseClassExtendsSealedClass extends SealedClass {}

interface class InterfaceExtendsSealedClass extends SealedClass {}

final class FinalExtendsSealedClass extends SealedClass {}

sealed class SealedExtendsSealedClass extends SealedClass {}

abstract class AbstractExtendsSealedClass extends SealedClass {}

abstract base class AbstractBaseExtendsSealedClass extends SealedClass {}

abstract interface class AbstractInterfaceExtendsSealedClass
    extends SealedClass {}

abstract final class AbstractFinalExtendsSealedClass extends SealedClass {}

mixin MixinOnSealedClass on SealedClass {}

base mixin BaseMixinOnSealedClass on SealedClass {}

main() {
  print(ClassExtendsSealedClass);
  print(BaseClassExtendsSealedClass);
  print(InterfaceExtendsSealedClass);
  print(FinalExtendsSealedClass);
  print(SealedExtendsSealedClass);
  print(AbstractExtendsSealedClass);
  print(AbstractBaseExtendsSealedClass);
  print(AbstractInterfaceExtendsSealedClass);
  print(AbstractFinalExtendsSealedClass);
  print(MixinOnSealedClass);
  print(BaseMixinOnSealedClass);
}
