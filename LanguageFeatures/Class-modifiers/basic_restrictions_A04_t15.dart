// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `sealed` and
/// has a superdeclaration marked `base`. Test `base` superdeclaration in the
/// same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base class BaseClass {}
abstract base class AbstractBaseClass {}
base mixin BaseMixin {}
base mixin class BaseMixinClass {}
abstract base mixin class AbstractBaseMixinClass {}

sealed class ExtendsBaseClass extends BaseClass {}

sealed class ImplementsBaseClass implements BaseClass {}

sealed class ExtendsAbstractBaseClass extends AbstractBaseClass {}

sealed class ImplementsAbstractBaseClass implements AbstractBaseClass {}

sealed class ClassWithBaseMixin with BaseMixin {}

sealed class ClassImplementsBaseMixin implements BaseMixin {}

sealed class ClassWithBaseMixinClass with BaseMixinClass {}

sealed class ClassImplementsBaseMixinClass implements BaseMixinClass {}

sealed class ClassWithBaseAbstractMixinClass with AbstractBaseMixinClass {}

sealed class ClassImplementsBaseAbstractMixinClass
    implements AbstractBaseMixinClass {}

main() {
  print(ExtendsBaseClass);
  print(ImplementsBaseClass);
  print(ExtendsAbstractBaseClass);
  print(ImplementsAbstractBaseClass);
  print(ClassWithBaseMixin);
  print(ClassImplementsBaseMixin);
  print(ClassWithBaseMixinClass);
  print(ClassImplementsBaseMixinClass);
  print(ClassWithBaseAbstractMixinClass);
  print(ClassImplementsBaseAbstractMixinClass);
}
