// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a constructor tearoff of the form
/// `C<TypeArguments>.name` or `C<TypeArguments>`, where `E.name` is the fully
/// resolved target for the constructor. Let `M` be the un-instantiated on-type
/// of `E` and let `Signature` be the parameter signature of `E.name`.
/// ...
/// Otherwise, let `TypeParameters1` be the type parameters declared by `E`.
/// Type inference for the tearoff is performed by subtyping matching
/// `M <# C<TypeArguments>` solving for `TypeParameters1`.
/// ...
/// It is a static error if `M1` is not a subtype of `C<TypeArguments>`.
///
/// @description Checks that if `E` is generic, then it is a compile-time error
/// if `M1` is not a subtype of `C<TypeArguments>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X, Y> {
  final Type t;
  C._(this.t);
}

mixin M<X, Y> {
  Type get t;
}

class MO<X, Y> with M<X, Y> {
  final Type t;
  MO._(this.t);
}

mixin class MC<X, Y> {
  Type t = Null;
  MC._();
}

extension type ET<X, Y>._(Type t) {}

extension ExtC3<T> on C<T, void Function(T)> {
  factory bar() => C<T, void Function(T)>._(T);
}

extension ExtM3<T> on M<T, void Function(T)> {
  factory bar() => MO<T, void Function(T)>._(T);
}

extension ExtMC3<T> on MC<T, void Function(T)> {
  factory bar() => MC<T, void Function(T)>._()..t = T;
}

extension ExtET3<T> on ET<T, void Function(T)> {
  factory bar() => ET<T, void Function(T)>._(T);
}

main() {
  // `C<T, void Function(T)> <# C<int, void Function(num)>` gives `T <: int` and
  // `num <: T`. There is no such `T`, so `M1` cannot be a subtype of
  // `C<TypeArguments>`.
  C<int, void Function(num)>.bar;
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // The same as above, the constraints are `T <: String` and `Object <: T`.
  C<String, void Function(Object)>.bar;
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int, void Function(num)>.bar;
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String, void Function(Object)>.bar;
//                                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int, void Function(num)>.bar;
//                            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String, void Function(Object)>.bar;
//                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int, void Function(num)>.bar;
//                            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String, void Function(Object)>.bar;
//                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
