// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that it is a compile-time error to extend a `base mixin`
/// in the same library where it is defined
/// (other cases are tested in `basic_restrictions_A04_t*`)
/// @author sgrekhov22@gmail.com

base mixin BaseMixin {}

class ClassExtendsBaseMixin extends BaseMixin {}
//                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClassExtendsBaseMixin extends BaseMixin {}
//                                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsBaseMixin extends BaseMixin {}
//                                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClassExtendsBaseMixin extends BaseMixin {}
//                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClassExtendsBaseMixin extends BaseMixin {}
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsBaseMixin extends BaseMixin {}
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClassExtendsBaseMixin extends BaseMixin {}
//                                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsBaseMixin extends BaseMixin {}
//                                                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClassExtendsBaseMixin extends BaseMixin {}
//                                                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsBaseMixin);
  print(BaseClassExtendsBaseMixin);
  print(InterfaceClassExtendsBaseMixin);
  print(FinalClassExtendsBaseMixin);
  print(SealedClassExtendsBaseMixin);
  print(AbstractClassExtendsBaseMixin);
  print(AbstractBaseClassExtendsBaseMixin);
  print(AbstractInterfaceClassExtendsBaseMixin);
  print(AbstractFinalClassExtendsBaseMixin);
}
