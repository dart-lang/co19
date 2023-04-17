// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is not an error if a declaration is `base` and
/// has a superdeclaration marked `final` in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class FinalClass {}
abstract final class AbstractFinalClass {}

base class BaseExtendsFinalClass extends FinalClass {}

abstract base class AbstractBaseExtendsFinalClass extends FinalClass {}

base class BaseImplementsFinalClass implements FinalClass {}

abstract base class AbstractBaseImplementsFinalClass implements FinalClass {}

base mixin MixinOnFinalClass on FinalClass {}

base mixin MixinImplementsFinalClass implements FinalClass {}

base mixin class MixinClassImplementsFinalClass implements FinalClass {}

abstract base mixin class AbstractMixinClassImplementsFinalClass
    implements FinalClass {}

base class BaseExtendsAbstractFinalClass extends AbstractFinalClass {}

abstract base class AbstractBaseExtendsAbstractFinalClass
    extends AbstractFinalClass {}

base class BaseImplementsAbstractFinalClass implements AbstractFinalClass {}

abstract base class AbstractBaseImplementsAbstractFinalClass
    implements AbstractFinalClass {}

base mixin MixinOnAbstractFinalClass on AbstractFinalClass {}

base mixin MixinImplementsAbstractFinalClass implements AbstractFinalClass {}

base mixin class MixinClassImplementsAbstractFinalClass
    implements AbstractFinalClass {}

abstract base mixin class AbstractMixinClassImplementsAbstractFinalClass
    implements AbstractFinalClass {}

main() {
  print(BaseExtendsFinalClass);
  print(AbstractBaseExtendsFinalClass);
  print(BaseImplementsFinalClass);
  print(AbstractBaseImplementsFinalClass);
  print(MixinOnFinalClass);
  print(MixinImplementsFinalClass);
  print(MixinClassImplementsFinalClass);
  print(AbstractMixinClassImplementsFinalClass);

  print(BaseExtendsAbstractFinalClass);
  print(AbstractBaseExtendsAbstractFinalClass);
  print(BaseImplementsAbstractFinalClass);
  print(AbstractBaseImplementsAbstractFinalClass);
  print(MixinOnAbstractFinalClass);
  print(MixinImplementsAbstractFinalClass);
  print(MixinClassImplementsAbstractFinalClass);
  print(AbstractMixinClassImplementsAbstractFinalClass);
}
