// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a mixin class declaration:
/// ...
/// - has a with clause
///
/// @description Check that it is a compile-time error if a `mixin class`
/// declaration has a `with` clause
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

main() {
  print(MixinClassWithObject);
  print(BaseMixinClassWithObject);
  print(AbstractMixinClassWithObject);
  print(AbstractBaseMixinClassWithObject);
  print(MixinClassWithM);
  print(BaseMixinClassWithM);
  print(AbstractMixinClassWithM);
  print(AbstractBaseMixinClassWithM);
}
