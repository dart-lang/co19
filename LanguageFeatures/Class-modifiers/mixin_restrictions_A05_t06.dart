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
/// non-mixin-application class declaration with a type `Object` as the declared
/// superclass has a mixin
/// @author sgrekhov22@gmail.com

mixin M {}

mixin class MixinClassWithM extends Object with M {}
//                                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassWithM extends Object with M {}
//                                                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassWithM extends Object with M {}
//                                                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassWithM extends Object with M {}
//                                                                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MixinClassWithM);
  print(BaseMixinClassWithM);
  print(AbstractMixinClassWithM);
  print(AbstractBaseMixinClassWithM);
}
