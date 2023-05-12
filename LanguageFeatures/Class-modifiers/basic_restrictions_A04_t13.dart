// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is no error if a declaration is `final` and has a
/// superdeclaration marked `base`. Test `base` superdeclaration in the same
/// library
/// @author sgrekhov22@gmail.com

base class BaseClass {}
abstract base class AbstractBaseClass {}
base mixin BaseMixin {}
base mixin class BaseMixinClass {}
abstract base mixin class AbstractBaseMixinClass {}

final class FinalExtendsBaseClass extends BaseClass {}

final class FinalImplementsBaseClass implements BaseClass {}

abstract final class AbstractFinalExtendsBaseClass extends BaseClass {}

abstract final class AbstractFinalImplementsBaseClass implements BaseClass {}

final class FinalClassWithBaseMixin with BaseMixin {}

final class FinalClassImplementsBaseMixin implements BaseMixin {}

final class FinalClassWithBaseMixinClass with BaseMixinClass {}

final class FinalClassImplementsBaseMixinClass implements BaseMixinClass {}

final class FinalExtendsAbstractBaseClass extends AbstractBaseClass {}

final class FinalImplementsAbstractBaseClass implements AbstractBaseClass {}

abstract final class AbstractFinalExtendsAbstractBaseClass
    extends AbstractBaseClass {}

abstract final class AbstractFinalImplementsAbstractBaseClass
    implements AbstractBaseClass {}

final class FinalClassWithAbstractBaseMixinClass with AbstractBaseMixinClass {}

final class FinalClassImplementsAbstractBaseMixinClass
    implements AbstractBaseMixinClass {}

enum EnumImplementsBaseClass implements BaseClass {e1, e2}

enum EnumImplementsAbstractBaseClass implements AbstractBaseClass {e1, e2}

enum EnumWithBaseMixin with BaseMixin { e1, e2 }

enum EnumImplementsBaseMixin implements BaseMixin { e1, e2 }

enum EnumWithBaseMixinClass with BaseMixinClass { e1, e2 }

enum EnumImplementsBaseMixinClass implements BaseMixinClass { e1, e2 }

enum EnumWithAbstractBaseMixinClass with AbstractBaseMixinClass { e1, e2 }

enum EnumImplementsAbstractBaseMixinClass implements AbstractBaseMixinClass {
  e1,
  e2
}

main() {
  print(FinalExtendsBaseClass);
  print(FinalImplementsBaseClass);
  print(AbstractFinalExtendsBaseClass);
  print(AbstractFinalImplementsBaseClass);
  print(FinalClassWithBaseMixin);
  print(FinalClassImplementsBaseMixin);
  print(FinalClassWithBaseMixinClass);
  print(FinalClassImplementsBaseMixinClass);
  print(FinalExtendsAbstractBaseClass);
  print(FinalImplementsAbstractBaseClass);
  print(AbstractFinalExtendsAbstractBaseClass);
  print(AbstractFinalImplementsAbstractBaseClass);
  print(FinalClassWithAbstractBaseMixinClass);
  print(FinalClassImplementsAbstractBaseMixinClass);
  print(EnumImplementsBaseClass);
  print(EnumImplementsAbstractBaseClass);
  print(EnumWithBaseMixin);
  print(EnumImplementsBaseMixin);
  print(EnumWithBaseMixinClass);
  print(EnumImplementsBaseMixinClass);
  print(EnumWithAbstractBaseMixinClass);
  print(EnumImplementsAbstractBaseMixinClass);
}
