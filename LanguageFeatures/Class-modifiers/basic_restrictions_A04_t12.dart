// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is no error if a declaration is `final` and has a
/// superdeclaration marked `base`. Test `base` superdeclaration in another
/// library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

final class FinalExtendsBaseClass extends BaseClass {}

abstract final class AbstractFinalExtendsBaseClass extends BaseClass {}

final class FinalClassWithBaseMixin with BaseMixin {}

final class FinalClassWithBaseMixinClass with BaseMixinClass {}

final class FinalExtendsAbstractBaseClass extends AbstractBaseClass {}

abstract final class AbstractFinalExtendsAbstractBaseClass
    extends AbstractBaseClass {}

final class FinalClassWithAbstractBaseMixinClass with AbstractBaseMixinClass {}

enum EnumWithBaseMixin with BaseMixin {e1, e2}

enum EnumWithBaseMixinClass with BaseMixinClass {e1, e2}

enum EnumWithAbstractBaseMixinClass with AbstractBaseMixinClass {e1, e2}

main() {
  print(FinalExtendsBaseClass);
  print(AbstractFinalExtendsBaseClass);
  print(FinalClassWithBaseMixin);
  print(FinalClassWithBaseMixinClass);
  print(FinalExtendsAbstractBaseClass);
  print(AbstractFinalExtendsAbstractBaseClass);
  print(FinalClassWithAbstractBaseMixinClass);
  print(EnumWithBaseMixin);
  print(EnumWithBaseMixinClass);
  print(EnumWithAbstractBaseMixinClass);
}
