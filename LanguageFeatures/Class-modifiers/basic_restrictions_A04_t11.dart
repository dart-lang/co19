// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is no error if a declaration is `base` and has a
/// superdeclaration marked `base`. Test `base` superdeclaration in the same
/// library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base class BaseClass {}
abstract base class AbstractBaseClass {}
base mixin BaseMixin {}
base mixin class BaseMixinClass {}
abstract base mixin class AbstractBaseMixinClass {}

base class ExtendsBaseClass extends BaseClass {}

base class ImplementsBaseClass implements BaseClass {}

abstract base class AbstractExtendsBaseClass extends BaseClass {}

abstract base class AbstractImplementsBaseClass implements BaseClass {}

base class ClassWithBaseMixin with BaseMixin {}

base class ClassWithBaseMixinClass with BaseMixinClass {}

base mixin MixinOnBaseClass on BaseClass {}

base mixin MixinImplementsBaseClass implements BaseClass {}

base class ExtendsAbstractBaseClass extends AbstractBaseClass {}

base class ImplementsAbstractBaseClass implements AbstractBaseClass {}

abstract base class AbstractExtendsAbstractBaseClass
    extends AbstractBaseClass {}

abstract base class AbstractImplementsAbstractBaseClass
    implements AbstractBaseClass {}

base class ClassWithAbstractBaseMixinClass with AbstractBaseMixinClass {}

base mixin MixinOnAbstractBaseClass on AbstractBaseClass {}

base mixin MixinImplementsAbstractBaseClass implements AbstractBaseClass {}

main() {
  print(ExtendsBaseClass);
  print(ImplementsBaseClass);
  print(AbstractExtendsBaseClass);
  print(AbstractImplementsBaseClass);
  print(ClassWithBaseMixin);
  print(ClassWithBaseMixinClass);
  print(MixinOnBaseClass);
  print(MixinImplementsBaseClass);
  print(ExtendsAbstractBaseClass);
  print(ImplementsAbstractBaseClass);
  print(AbstractExtendsAbstractBaseClass);
  print(AbstractImplementsAbstractBaseClass);
  print(ClassWithAbstractBaseMixinClass);
  print(MixinOnAbstractBaseClass);
  print(MixinImplementsAbstractBaseClass);
}
