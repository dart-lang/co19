// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is not an error if `abstract interface class` is
/// extended in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

abstract interface class AbstractInterfaceClass {}

class ClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {} // reopen

base class BaseClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {} // reopen

interface class InterfaceClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {}

final class FinalClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {}

sealed class SealedClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {}

abstract class AbstractClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {} // reopen

abstract base class AbstractBaseClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {} // reopen

abstract interface class AbstractInterfaceClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {}

abstract final class AbstractFinalClassExtendsAbstractInterfaceClass
    extends AbstractInterfaceClass {}

main() {
  print(ClassExtendsAbstractInterfaceClass);
  print(BaseClassExtendsAbstractInterfaceClass);
  print(InterfaceClassExtendsAbstractInterfaceClass);
  print(FinalClassExtendsAbstractInterfaceClass);
  print(SealedClassExtendsAbstractInterfaceClass);
  print(AbstractClassExtendsAbstractInterfaceClass);
  print(AbstractBaseClassExtendsAbstractInterfaceClass);
  print(AbstractInterfaceClassExtendsAbstractInterfaceClass);
  print(AbstractFinalClassExtendsAbstractInterfaceClass);
}
