// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an instance creation expression of the form
/// `C<TypeArguments>.name(arguments)` or `C<TypeArguments>(arguments)`, where
/// `E.name` is the fully resolved target of the constructor.
/// ...
/// It is a static error if the fully instantiated on-type of `E` - that is, the
/// on-type of `E` with the inferred type arguments of the fully resolved
/// invocation substituted for the type parameters of `E` - is not a subtype of
/// `C<TypeArguments>`.
///
/// @description Checks that it is a compile-time error if the fully
/// instantiated on-type of `E` is not a subtype of `C<TypeArguments>`.
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

extension ExtC2 on C<int, String> {
  factory foo() => C<int, String>._(int);
}

extension ExtC3<T> on C<T, void Function(T)> {
  factory bar() => C<T, void Function(T)>._(T);
}

extension ExtM2 on M<int, String> {
  factory foo() => MO<int, String>._(int);
}

extension ExtM3<T> on M<T, void Function(T)> {
  factory bar() => MO<T, void Function(T)>._(T);
}

extension ExtMC2 on MC<int, String> {
  factory foo() => MC<int, String>._()..t = int;
}

extension ExtMC3<T> on MC<T, void Function(T)> {
  factory bar() => MC<T, void Function(T)>._()..t = T;
}

extension ExtET2 on ET<int, String> {
  factory foo() => ET<int, String>._(int);
}

extension ExtET3<T> on ET<T, void Function(T)> {
  factory bar() => ET<T, void Function(T)>._(T);
}

main() {
  C<int, int>.foo();
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<String, String>.foo();
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  C<int, void Function(num)>.bar();
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int, int>.foo();
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String, String>.foo();
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int, void Function(num)>.bar();
//                           ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int, int>.foo();
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String, String>.foo();
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int, void Function(num)>.bar();
//                            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int, int>.foo();
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String, String>.foo();
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int, void Function(num)>.bar();
//                            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
