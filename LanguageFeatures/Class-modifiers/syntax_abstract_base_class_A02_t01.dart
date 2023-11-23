// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Check that it is not an error to extend an
/// `abstract base class` (by `base/final/sealed`) outside of the library where
/// it is defined (other cases tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class BaseClassExtendsAbstractBaseClass extends AbstractBaseClass {}

final class FinalClassExtendsAbstractBaseClass extends AbstractBaseClass {}

sealed class SealedClassExtendsAbstractBaseClass extends AbstractBaseClass {}

abstract base class AbstractBaseClassExtendsAbstractBaseClass
    extends AbstractBaseClass {}

abstract final class AbstractFinalClassExtendsAbstractBaseClass
    extends AbstractBaseClass {}

main() {
  print(BaseClassExtendsAbstractBaseClass);
  print(FinalClassExtendsAbstractBaseClass);
  print(SealedClassExtendsAbstractBaseClass);
  print(AbstractBaseClassExtendsAbstractBaseClass);
  print(AbstractFinalClassExtendsAbstractBaseClass);
}
