// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a mixin class declaration:
/// ...
/// - has an extends clause
///
/// @description Check that it is a compile-time error if a `mixin class`
/// declaration has an `extends` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class C {}

mixin class MixinClassExtendsObject extends Object {}
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassExtendsObject extends Object {}
//                                           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsObject extends Object {}
//                                                   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassExtendsObject extends Object {}
//                                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassExtendsC extends C {}
//                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClassExtendsC extends C {}
//                                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassExtendsC extends C {}
//                                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClassExtendsC extends C {}
//                                                       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(MixinClassExtendsObject);
  print(BaseMixinClassExtendsObject);
  print(AbstractMixinClassExtendsObject);
  print(AbstractBaseMixinClassExtendsObject);
  print(MixinClassExtendsC);
  print(BaseMixinClassExtendsC);
  print(AbstractMixinClassExtendsC);
  print(AbstractBaseMixinClassExtendsC);
}
