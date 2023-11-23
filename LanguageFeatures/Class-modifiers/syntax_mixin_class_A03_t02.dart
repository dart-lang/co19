// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin class can be constructed, extended, implemented and mixed
/// in but is not exhaustive
///
/// @description Checks that a `mixin class` can be mixed in in the same
/// library where it is defined
/// @author sgrekhov22@gmail.com

mixin class MixinClass {}

class ClassWithMixinClass with MixinClass {}

base class BaseClassWithMixinClass with MixinClass {}

interface class InterfaceClassWithMixinClass with MixinClass {}

final class FinalClassWithMixinClass with MixinClass {}

sealed class SealedClassWithMixinClass with MixinClass {}

abstract class AbstractClassWithMixinClass with MixinClass {}

abstract base class AbstractBaseClassWithMixinClass with MixinClass {}

abstract interface class AbstractInterfaceClassWithMixinClass with MixinClass {}

abstract final class AbstractFinalClassWithMixinClass with MixinClass {}

enum EnumWithMixinClass with MixinClass { e1, e2 }

main() {
  print(ClassWithMixinClass);
  print(BaseClassWithMixinClass);
  print(InterfaceClassWithMixinClass);
  print(FinalClassWithMixinClass);
  print(SealedClassWithMixinClass);
  print(AbstractClassWithMixinClass);
  print(AbstractBaseClassWithMixinClass);
  print(AbstractInterfaceClassWithMixinClass);
  print(AbstractFinalClassWithMixinClass);
  print(EnumWithMixinClass);
}
