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
/// @description Check that it is a compile-time error if a
/// non-mixin-application class declaration with no declared superclass has a
/// mixin
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

mixin M {}

mixin class MixinClassWithObject with Object {}
//                               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassWithObject with Object {}
//                                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassWithObject with Object {}
//                                                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassWithObject with Object {}
//                                                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassWithM with M {}
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassWithM with M {}
//                                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassWithM with M {}
//                                           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassWithM with M {}
//                                                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef TypedefObject = Object;

mixin class MixinClassWithTypedefObject with TypedefObject {}
//                                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MixinClassWithObject);
  print(BaseMixinClassWithObject);
  print(AbstractMixinClassWithObject);
  print(AbstractBaseMixinClassWithObject);
  print(MixinClassWithM);
  print(BaseMixinClassWithM);
  print(AbstractMixinClassWithM);
  print(AbstractBaseMixinClassWithM);
  print(MixinClassWithTypedefObject);
}
