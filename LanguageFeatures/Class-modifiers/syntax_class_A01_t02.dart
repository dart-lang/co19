// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Class with no modifiers can be constructed, extended, implemented
/// but not mixed in and is not exhaustive
///
/// @description Checks that class with no modifiers can be constructed and
/// extended in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class Class {}

class ClassExtendsClass extends Class {}

base class BaseClassExtendsClass extends Class {}

interface class InterfaceClassExtendsClass extends Class {}

final class FinalClassExtendsClass extends Class {}

sealed class SealedClassExtendsClass extends Class {}

abstract class AbstractClassExtendsClass extends Class {}

abstract base class AbstractBaseClassExtendsClass extends Class {}

abstract interface class AbstractInterfaceClassExtendsClass extends Class {}

abstract final class AbstractFinalClassExtendsClass extends Class {}

main() {
  Class();

  print(ClassExtendsClass);
  print(BaseClassExtendsClass);
  print(InterfaceClassExtendsClass);
  print(FinalClassExtendsClass);
  print(SealedClassExtendsClass);
  print(AbstractClassExtendsClass);
  print(AbstractBaseClassExtendsClass);
  print(AbstractInterfaceClassExtendsClass);
  print(AbstractFinalClassExtendsClass);
}
