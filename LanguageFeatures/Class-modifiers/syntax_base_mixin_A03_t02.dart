// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to implement a
/// `base mixin` by not a `base/final/sealed` class in the library where it is
/// defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

base mixin BaseMixin {}

class ImplementsBaseMixin implements BaseMixin {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseMixin implements BaseMixin {}
//                                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseMixin implements BaseMixin {}
//                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsBaseMixin implements BaseMixin {}
//                                                                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsBaseMixin implements BaseMixin {}
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsBaseMixin implements BaseMixin {}
//                                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsBaseMixin implements BaseMixin {}
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsBaseMixin);
  print(InterfaceImplementsBaseMixin);
  print(AbstractImplementsBaseMixin);
  print(AbstractInterfaceImplementsBaseMixin);
  print(MixinClassImplementsBaseMixin);
  print(AbstractMixinClassImplementsBaseMixin);
  print(MixinImplementsBaseMixin);
}
