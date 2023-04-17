// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is no error if a declaration is `base` and has a
/// superdeclaration marked `base`. Test `base` superdeclaration in another
/// library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class ExtendsBaseClass extends BaseClass {}

abstract base class AbstractExtendsBaseClass extends BaseClass {}

base class ClassWithBaseMixin with BaseMixin {}

base class ClassWithBaseMixinClass with BaseMixinClass {}

base mixin MixinOnBaseClass on BaseClass {}

base class ExtendsAbstractBaseClass extends AbstractBaseClass {}

abstract base class AbstractExtendsAbstractBaseClass extends AbstractBaseClass {}

base class ClassWithAbstractBaseMixinClass with AbstractBaseMixinClass {}

base mixin MixinOnAbstractBaseClass on AbstractBaseClass {}

main() {
  print(ExtendsBaseClass);
  print(ClassWithBaseMixin);
  print(ClassWithBaseMixinClass);
  print(MixinOnBaseClass);
  print(ExtendsAbstractBaseClass);
  print(AbstractExtendsAbstractBaseClass);
  print(ClassWithAbstractBaseMixinClass);
  print(MixinOnAbstractBaseClass);
}
