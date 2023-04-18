// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interface class can be constructed and implemented but not
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is not an error if `interface class` is extended
/// in the same library where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

interface class InterfaceClass {}

class ClassExtendsInterfaceClass extends InterfaceClass {}

base class BaseClassExtendsInterfaceClass extends InterfaceClass {}

interface class InterfaceClassExtendsInterfaceClass extends InterfaceClass {}

final class FinalClassExtendsInterfaceClass extends InterfaceClass {}

sealed class SealedClassExtendsInterfaceClass extends InterfaceClass {}

abstract class AbstractClassExtendsInterfaceClass extends InterfaceClass {}

abstract base class AbstractBaseClassExtendsInterfaceClass
    extends InterfaceClass {}

abstract interface class AbstractInterfaceClassExtendsInterfaceClass
    extends InterfaceClass {}

abstract final class AbstractFinalClassExtendsInterfaceClass
    extends InterfaceClass {}

main() {
  print(ClassExtendsInterfaceClass);
  print(BaseClassExtendsInterfaceClass);
  print(InterfaceClassExtendsInterfaceClass);
  print(FinalClassExtendsInterfaceClass);
  print(SealedClassExtendsInterfaceClass);
  print(AbstractClassExtendsInterfaceClass);
  print(AbstractBaseClassExtendsInterfaceClass);
  print(AbstractInterfaceClassExtendsInterfaceClass);
  print(AbstractFinalClassExtendsInterfaceClass);
}
