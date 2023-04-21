// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin class can be constructed, extended, implemented and mixed
/// in but is not exhaustive
///
/// @description Checks that a `mixin class` can be constructed and extended
/// outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassExtendsMixinClass extends MixinClass {}

base class BaseClassExtendsMixinClass extends MixinClass {}

interface class InterfaceClassExtendsMixinClass extends MixinClass {}

final class FinalClassExtendsMixinClass extends MixinClass {}

sealed class SealedClassExtendsMixinClass extends MixinClass {}

abstract class AbstractClassExtendsMixinClass extends MixinClass {}

abstract base class AbstractBaseClassExtendsMixinClass extends MixinClass {}

abstract interface class AbstractInterfaceClassExtendsMixinClass
    extends MixinClass {}

abstract final class AbstractFinalClassExtendsMixinClass extends MixinClass {}

main() {
  MixinClass();
  print(ClassExtendsMixinClass);
  print(BaseClassExtendsMixinClass);
  print(InterfaceClassExtendsMixinClass);
  print(FinalClassExtendsMixinClass);
  print(SealedClassExtendsMixinClass);
  print(AbstractClassExtendsMixinClass);
  print(AbstractBaseClassExtendsMixinClass);
  print(AbstractInterfaceClassExtendsMixinClass);
  print(AbstractFinalClassExtendsMixinClass);
}
