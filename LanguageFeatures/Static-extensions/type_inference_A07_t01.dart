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
/// @description Checks that if `E` is not generic, then the static type of
/// `C<TypeArguments>.name` is `C<TypeArguments> Function(Signature)`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

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
  // `ExtC2` is not generic, so nothing is inferred. `C<TypeArguments>` is the
  // on-type of `ExtC2` here.
  var cf1 = C<int, String>.foo;
  cf1.expectStaticType<Exactly<C<int, String> Function()>>();
  Expect.equals(int, cf1().t);
  // The on-type `C<int, String>` is a subtype of `C<num, Object>`. The return
  // type of the tearoff is `C<TypeArguments>` and not the on-type.
  var cf2 = C<num, Object>.foo;
  cf2.expectStaticType<Exactly<C<num, Object> Function()>>();
  Expect.equals(int, cf2().t);

  var mf1 = M<int, String>.foo;
  mf1.expectStaticType<Exactly<M<int, String> Function()>>();
  Expect.equals(int, mf1().t);
  var mf2 = M<num, Object>.foo;
  mf2.expectStaticType<Exactly<M<num, Object> Function()>>();
  Expect.equals(int, mf2().t);

  var mcf1 = MC<int, String>.foo;
  mcf1.expectStaticType<Exactly<MC<int, String> Function()>>();
  Expect.equals(int, mcf1().t);
  var mcf2 = MC<num, Object>.foo;
  mcf2.expectStaticType<Exactly<MC<num, Object> Function()>>();
  Expect.equals(int, mcf2().t);

  var etf1 = ET<int, String>.foo;
  etf1.expectStaticType<Exactly<ET<int, String> Function()>>();
  Expect.equals(int, etf1().t);
  var etf2 = ET<num, Object>.foo;
  etf2.expectStaticType<Exactly<ET<num, Object> Function()>>();
  Expect.equals(int, etf2().t);
}
