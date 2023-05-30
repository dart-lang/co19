// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When a generic class C declares a type parameter X, it is a
/// compile-time error if X occurs in a non-covariant position in a type which
/// specifies a superinterface of C
///
/// @description Checks that it is a compile-time error if a generic class `C`
/// declares a type parameter `X` which occurs in a non-covariant position in a
/// type which specifies a superinterface of `C`. Test different class modifiers
/// @author sgrekhov22@gmail.com

mixin class A<T> {}

base class BaseClass1<T> extends A<void Function(T)> {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClass2<T> implements A<void Function(T)> {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseClass3<T> with A<void Function(T)> {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClass1<T> extends A<void Function(T)> {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClass2<T> implements A<void Function(T)> {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClass3<T> with A<void Function(T)> {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClass1<T> extends A<void Function(T)> {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClass2<T> implements A<void Function(T)> {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalClass3<T> with A<void Function(T)> {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClass1<T> extends A<void Function(T)> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClass2<T> implements A<void Function(T)> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedClass3<T> with A<void Function(T)> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClass1<T> extends A<void Function(T)> {}
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClass2<T> implements A<void Function(T)> {}
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClass3<T> with A<void Function(T)> {}
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClass1<T> extends A<void Function(T)> {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClass2<T> implements A<void Function(T)> {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseClass3<T> with A<void Function(T)> {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClass1<T> extends A<void Function(T)> {}
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClass2<T> implements A<void Function(T)> {}
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClass3<T> with A<void Function(T)> {}
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClass1<T> extends A<void Function(T)> {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClass2<T> implements A<void Function(T)> {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalClass3<T> with A<void Function(T)> {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClass<T> implements A<void Function(T)> {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class BaseMixinClass<T> implements A<void Function(T)> {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClass<T> implements A<void Function(T)> {}
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified

abstract base mixin class AbstractBaseMixinClass<T> implements A<void Function(T)> {}
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified

mixin Mixin<T> implements A<void Function(T)> {}
//          ^
// [analyzer] unspecified
// [cfe] unspecified

base mixin BaseMixin<T> implements A<void Function(T)> {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(BaseClass1);
  print(BaseClass2);
  print(BaseClass3);
  print(InterfaceClass1);
  print(InterfaceClass2);
  print(InterfaceClass3);
  print(FinalClass1);
  print(FinalClass2);
  print(FinalClass3);
  print(SealedClass1);
  print(SealedClass2);
  print(SealedClass3);
  print(AbstractClass1);
  print(AbstractClass2);
  print(AbstractClass3);
  print(AbstractBaseClass1);
  print(AbstractBaseClass2);
  print(AbstractBaseClass3);
  print(AbstractInterfaceClass1);
  print(AbstractInterfaceClass2);
  print(AbstractInterfaceClass3);
  print(AbstractFinalClass1);
  print(AbstractFinalClass2);
  print(AbstractFinalClass3);
  print(MixinClass);
  print(BaseMixinClass);
  print(AbstractMixinClass);
  print(AbstractBaseMixinClass);
  print(Mixin);
  print(BaseMixin);
}
