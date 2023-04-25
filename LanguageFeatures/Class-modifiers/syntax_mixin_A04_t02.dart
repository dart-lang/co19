// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin can be implemented and mixed in but not constructed or
/// extended and is not exhaustive
///
/// @description Checks that a `mixin` can be mixed in the same library where it
/// is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

mixin Mixin {}

class ClassWithMixin with Mixin {}

base class BaseClassWithMixin with Mixin {}

interface class InterfaceClassWithMixin with Mixin {}

final class FinalClassWithMixin with Mixin {}

sealed class SealedClassWithMixin with Mixin {}

abstract class AbstractClassWithMixin with Mixin {}

abstract base class AbstractBaseClassWithMixin with Mixin {}

abstract interface class AbstractInterfaceClassWithMixin with Mixin {}

abstract final class AbstractFinalClassWithMixin with Mixin {}

enum EnumWithMixin with Mixin { e1, e2 }

main() {
  print(ClassWithMixin);
  print(BaseClassWithMixin);
  print(InterfaceClassWithMixin);
  print(FinalClassWithMixin);
  print(SealedClassWithMixin);
  print(AbstractClassWithMixin);
  print(AbstractBaseClassWithMixin);
  print(AbstractInterfaceClassWithMixin);
  print(AbstractFinalClassWithMixin);
  print(EnumWithMixin);
}
