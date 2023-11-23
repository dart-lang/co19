// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin class declaration has Object from dart:core as superclass
/// iff it’s either:
/// ...
/// - A mixin application class declaration where the declared superclass is the
///   Object class from dart:core, and which has precisely one declared mixin.
///   E.g., mixin class C = Object with M;
/// - A non-mixin-application class declaration with no declared mixins, and
///   either no declared superclass, or with a type denoting Object from
///   dart:core as the declared superclass. E.g., mixin class C {} or
///   mixin class C extends Object {}
/// The mixin class declarations can also have interfaces, type parameters, and
/// modifiers, but no extends or with clauses other than those shown here.
///
/// @description Check that it is not an error to declare a
/// non-mixin-application class declaration with no declared mixins, an either
/// no declared superclass, or with a type denoting `Object` from `dart:core` as
/// the declared superclass
/// @author sgrekhov22@gmail.com

mixin class MixinClass {}

base mixin class BaseMixinClass {}

abstract mixin class AbstractMixinClass {}

abstract base mixin class AbstractBaseMixinClass {}

mixin class MixinClassExtendsObject extends Object {}

base mixin class BaseMixinClassExtendsObject extends Object {}

abstract mixin class AbstractMixinClassExtendsObject extends Object {}

abstract base mixin class AbstractBaseMixinClassExtendsObject extends Object {}

typedef TypedefObject = Object;

mixin class MixinClassExtendsTypedefObject extends TypedefObject {}

main() {
  print(MixinClass);
  print(BaseMixinClass);
  print(AbstractMixinClass);
  print(AbstractBaseMixinClass);
  print(MixinClassExtendsObject);
  print(BaseMixinClassExtendsObject);
  print(AbstractMixinClassExtendsObject);
  print(AbstractBaseMixinClassExtendsObject);
  print(MixinClassExtendsTypedefObject);
}
