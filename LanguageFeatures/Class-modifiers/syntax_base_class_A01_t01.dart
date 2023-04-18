// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that `base class` can be constructed and extended by
/// `base/final/sealed` classes
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class LocalBaseClass {}

base class BaseClassExtendsBaseClass extends BaseClass {}

final class FinalClassExtendsBaseClass extends BaseClass {}

sealed class SealedClassExtendsBaseClass extends BaseClass {}

abstract base class AbstractBaseClassExtendsBaseClass extends BaseClass {}

abstract final class AbstractFinalClassExtendsBaseClass extends BaseClass {}

base class BaseClassExtendsLocalBaseClass extends LocalBaseClass {}

final class FinalClassExtendsLocalBaseClass extends LocalBaseClass {}

sealed class SealedClassExtendsLocalBaseClass extends LocalBaseClass {}

abstract base class AbstractBaseClassExtendsLocalBaseClass
    extends LocalBaseClass {}

abstract final class AbstractFinalClassExtendsLocalBaseClass
    extends LocalBaseClass {}

main() {
  BaseClass();
  LocalBaseClass();

  print(BaseClassExtendsBaseClass);
  print(FinalClassExtendsBaseClass);
  print(SealedClassExtendsBaseClass);
  print(AbstractBaseClassExtendsBaseClass);
  print(AbstractFinalClassExtendsBaseClass);

  print(BaseClassExtendsLocalBaseClass);
  print(FinalClassExtendsLocalBaseClass);
  print(SealedClassExtendsLocalBaseClass);
  print(AbstractBaseClassExtendsLocalBaseClass);
  print(AbstractFinalClassExtendsLocalBaseClass);
}
