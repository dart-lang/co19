// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that an `abstract mixin class` can be extended outside
/// of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassExtendsAbstractMixinClass extends AbstractMixinClass {}

base class BaseClassExtendsAbstractMixinClass extends AbstractMixinClass {}

interface class InterfaceClassExtendsAbstractMixinClass
    extends AbstractMixinClass {}

final class FinalClassExtendsAbstractMixinClass extends AbstractMixinClass {}

sealed class SealedClassExtendsAbstractMixinClass extends AbstractMixinClass {}

abstract class AbstractClassExtendsAbstractMixinClass
    extends AbstractMixinClass {}

abstract base class AbstractBaseClassExtendsAbstractMixinClass
    extends AbstractMixinClass {}

abstract interface class AbstractInterfaceClassExtendsAbstractMixinClass
    extends AbstractMixinClass {}

abstract final class AbstractFinalClassExtendsAbstractMixinClass
    extends AbstractMixinClass {}

main() {
  print(ClassExtendsAbstractMixinClass);
  print(BaseClassExtendsAbstractMixinClass);
  print(InterfaceClassExtendsAbstractMixinClass);
  print(FinalClassExtendsAbstractMixinClass);
  print(SealedClassExtendsAbstractMixinClass);
  print(AbstractClassExtendsAbstractMixinClass);
  print(AbstractBaseClassExtendsAbstractMixinClass);
  print(AbstractInterfaceClassExtendsAbstractMixinClass);
  print(AbstractFinalClassExtendsAbstractMixinClass);
}
