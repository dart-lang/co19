// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that an `abstract mixin class` can be mixed in in the
/// same library where it is defined
/// @author sgrekhov22@gmail.com

abstract mixin class AbstractMixinClass {}

class ClassWithAbstractMixinClass with AbstractMixinClass {}

base class BaseClassWithAbstractMixinClass with AbstractMixinClass {}

interface class InterfaceClassWithAbstractMixinClass with AbstractMixinClass {}

final class FinalClassWithAbstractMixinClass with AbstractMixinClass {}

sealed class SealedClassWithAbstractMixinClass with AbstractMixinClass {}

abstract class AbstractClassWithAbstractMixinClass with AbstractMixinClass {}

abstract base class AbstractBaseClassWithAbstractMixinClass
    with AbstractMixinClass {}

abstract interface class AbstractInterfaceClassWithAbstractMixinClass
    with AbstractMixinClass {}

abstract final class AbstractFinalClassWithAbstractMixinClass
    with AbstractMixinClass {}

enum EnumWithAbstractMixinClass with AbstractMixinClass { e1, e2 }

main() {
  print(ClassWithAbstractMixinClass);
  print(BaseClassWithAbstractMixinClass);
  print(InterfaceClassWithAbstractMixinClass);
  print(FinalClassWithAbstractMixinClass);
  print(SealedClassWithAbstractMixinClass);
  print(AbstractClassWithAbstractMixinClass);
  print(AbstractBaseClassWithAbstractMixinClass);
  print(AbstractInterfaceClassWithAbstractMixinClass);
  print(AbstractFinalClassWithAbstractMixinClass);
  print(EnumWithAbstractMixinClass);
}
