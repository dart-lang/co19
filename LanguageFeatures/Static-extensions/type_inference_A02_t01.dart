// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an instance creation expression of the form
/// `C<TypeArguments>.name(arguments)` or `C<TypeArguments>(arguments)`, where
/// `E.name` is the fully resolved target of the constructor.
///
/// Type inference for such an invocation is done by performing inference on the
/// invocation `E.name(arguments)` as defined in the subsequent section, using
/// `C<TypeArguments>` as the downwards context.
/// ...
/// The static type of the original instance creation expression in this case is
/// `C<TypeArguments>`.
///
/// @description Checks that type inference for
/// `C<TypeArguments>.name(arguments)` and `C<TypeArguments>(arguments)` is
/// performed on `E.name(arguments)` using `C<TypeArguments>` (and not the
/// context type of the original expression) as the downwards context, and that
/// the static type of the invocation is `C<TypeArguments>`.
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

extension ExtC<T> on C<T, T> {
  factory fromList(List<T> _) => C<T, T>._(T);
  factory(List<T> _) => C<T, T>._(T);
}

extension ExtC2 on C<int, String> {
  factory foo() => C<int, String>._(int);
}

extension ExtM<T> on M<T, T> {
  factory fromList(List<T> _) => MO<T, T>._(T);
  factory(List<T> _) => MO<T, T>._(T);
}

extension ExtM2 on M<int, String> {
  factory foo() => MO<int, String>._(int);
}

extension ExtMC<T> on MC<T, T> {
  factory fromList(List<T> _) => MC<T, T>._()..t = T;
  factory(List<T> _) => MC<T, T>._()..t = T;
}

extension ExtMC2 on MC<int, String> {
  factory foo() => MC<int, String>._()..t = int;
}

extension ExtET<T> on ET<T, T> {
  factory fromList(List<T> _) => ET<T, T>._(T);
  factory(List<T> _) => ET<T, T>._(T);
}

extension ExtET2 on ET<int, String> {
  factory foo() => ET<int, String>._(int);
}

main() {
  // The context `C<num, int>` gives `T <: num` and `T <: int`, so `T` is `int`.
  // The static type is `C<TypeArguments>` and not the instantiated on-type
  // `C<int, int>`.
  var c1 = C<num, int>.fromList([1]);
  c1.expectStaticType<Exactly<C<num, int>>>();
  Expect.equals(int, c1.t);
  // The same as above, but for the unnamed constructor.
  var c2 = C<num, int>([1]);
  c2.expectStaticType<Exactly<C<num, int>>>();
  Expect.equals(int, c2.t);
  // The downwards context is `C<num, int>` and not the context type
  // `C<num, num>` of the original expression, so `T` is `int` and not `num`.
  C<num, num> c3 = C<num, int>.fromList([1]);
  Expect.equals(int, c3.t);
  // The same as above, but for the unnamed constructor.
  C<num, num> c4 = C<num, int>([1]);
  Expect.equals(int, c4.t);
  // The context `C<int, num>` gives `T <: int` and `T <: num`, so `T` is `int`.
  var c5 = C<int, num>.fromList([1]);
  c5.expectStaticType<Exactly<C<int, num>>>();
  Expect.equals(int, c5.t);
  // The context `C<int, String>` gives `T <: int` and `T <: String`. These
  // types are unrelated, so `T` is `Never` and the argument is `<Never>[]`.
  var c6 = C<int, String>([]);
  c6.expectStaticType<Exactly<C<int, String>>>();
  Expect.equals(Never, c6.t);
  // `ExtC2` is not generic and its on-type `C<int, String>` is a subtype of
  // `C<num, Object>`. The static type is `C<TypeArguments>` and not the
  // on-type.
  var c7 = C<num, Object>.foo();
  c7.expectStaticType<Exactly<C<num, Object>>>();
  Expect.equals(int, c7.t);

  var m1 = M<num, int>.fromList([1]);
  m1.expectStaticType<Exactly<M<num, int>>>();
  Expect.equals(int, m1.t);
  var m2 = M<num, int>([1]);
  m2.expectStaticType<Exactly<M<num, int>>>();
  Expect.equals(int, m2.t);
  M<num, num> m3 = M<num, int>.fromList([1]);
  Expect.equals(int, m3.t);
  M<num, num> m4 = M<num, int>([1]);
  Expect.equals(int, m4.t);
  var m5 = M<int, num>.fromList([1]);
  m5.expectStaticType<Exactly<M<int, num>>>();
  Expect.equals(int, m5.t);
  var m6 = M<int, String>([]);
  m6.expectStaticType<Exactly<M<int, String>>>();
  Expect.equals(Never, m6.t);
  var m7 = M<num, Object>.foo();
  m7.expectStaticType<Exactly<M<num, Object>>>();
  Expect.equals(int, m7.t);

  var mc1 = MC<num, int>.fromList([1]);
  mc1.expectStaticType<Exactly<MC<num, int>>>();
  Expect.equals(int, mc1.t);
  var mc2 = MC<num, int>([1]);
  mc2.expectStaticType<Exactly<MC<num, int>>>();
  Expect.equals(int, mc2.t);
  MC<num, num> mc3 = MC<num, int>.fromList([1]);
  Expect.equals(int, mc3.t);
  MC<num, num> mc4 = MC<num, int>([1]);
  Expect.equals(int, mc4.t);
  var mc5 = MC<int, num>.fromList([1]);
  mc5.expectStaticType<Exactly<MC<int, num>>>();
  Expect.equals(int, mc5.t);
  var mc6 = MC<int, String>([]);
  mc6.expectStaticType<Exactly<MC<int, String>>>();
  Expect.equals(Never, mc6.t);
  var mc7 = MC<num, Object>.foo();
  mc7.expectStaticType<Exactly<MC<num, Object>>>();
  Expect.equals(int, mc7.t);

  var et1 = ET<num, int>.fromList([1]);
  et1.expectStaticType<Exactly<ET<num, int>>>();
  Expect.equals(int, et1.t);
  var et2 = ET<num, int>([1]);
  et2.expectStaticType<Exactly<ET<num, int>>>();
  Expect.equals(int, et2.t);
  ET<num, num> et3 = ET<num, int>.fromList([1]);
  Expect.equals(int, et3.t);
  ET<num, num> et4 = ET<num, int>([1]);
  Expect.equals(int, et4.t);
  var et5 = ET<int, num>.fromList([1]);
  et5.expectStaticType<Exactly<ET<int, num>>>();
  Expect.equals(int, et5.t);
  var et6 = ET<int, String>([]);
  et6.expectStaticType<Exactly<ET<int, String>>>();
  Expect.equals(Never, et6.t);
  var et7 = ET<num, Object>.foo();
  et7.expectStaticType<Exactly<ET<num, Object>>>();
  Expect.equals(int, et7.t);
}
