// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a constructor tearoff of the form
/// `C<TypeArguments>.name` or `C<TypeArguments>`, where `E.name` is the fully
/// resolved target for the constructor. Let `M` be the un-instantiated on-type
/// of `E` and let `Signature` be the parameter signature of `E.name`.
///
/// If `E` declares no type parameters, then no further inference is required,
/// and the static type of the tearoff is
/// `C<TypeArguments> Function(Signature)`.
///
/// It is a static error if `M` is not a subtype of `C<TypeArguments>`.
///
/// @description Checks that if `E` is not generic, then it is a compile-time
/// error if `M` is not a subtype of `C<TypeArguments>`.
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

extension ExtM2 on M<int, String> {
  factory foo() => MO<int, String>._(int);
}

extension ExtMC2 on MC<int, String> {
  factory foo() => MC<int, String>._()..t = int;
}

extension ExtET2 on ET<int, String> {
  factory foo() => ET<int, String>._(int);
}

main() {
  // The on-type `C<int, String>` is not a subtype of `C<int, int>`.
  C<int, int>.foo;
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  // The on-type `C<int, String>` is not a subtype of `C<String, String>`.
  C<String, String>.foo;
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<int, int>.foo;
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M<String, String>.foo;
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<int, int>.foo;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC<String, String>.foo;
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<int, int>.foo;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET<String, String>.foo;
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
