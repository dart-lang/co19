// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Check that it is not an error to extend an `abstract class`
/// outside of the library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ClassExtendsAbstractClass extends AbstractClass {}

base class BaseClassExtendsAbstractClass extends AbstractClass {}

interface class InterfaceClassExtendsAbstractClass extends AbstractClass {}

final class FinalClassExtendsAbstractClass extends AbstractClass {}

sealed class SealedClassExtendsAbstractClass extends AbstractClass {}

abstract class AbstractClassExtendsAbstractClass extends AbstractClass {}

abstract base class AbstractBaseClassExtendsAbstractClass
    extends AbstractClass {}

abstract interface class AbstractInterfaceClassExtendsAbstractClass
    extends AbstractClass {}

abstract final class AbstractFinalClassExtendsAbstractClass
    extends AbstractClass {}

main() {
  print(ClassExtendsAbstractClass);
  print(BaseClassExtendsAbstractClass);
  print(InterfaceClassExtendsAbstractClass);
  print(FinalClassExtendsAbstractClass);
  print(SealedClassExtendsAbstractClass);
  print(AbstractClassExtendsAbstractClass);
  print(AbstractBaseClassExtendsAbstractClass);
  print(AbstractInterfaceClassExtendsAbstractClass);
  print(AbstractFinalClassExtendsAbstractClass);
}
