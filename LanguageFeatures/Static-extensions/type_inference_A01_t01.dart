// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an instance creation expression of the form
/// `C.name(arguments)` or `C(arguments)`, where `E.name` is the fully resolved
/// target of the constructor invocation.
/// ...
/// Type inference for such an invocation is done by performing inference on the
/// invocation `E.name(arguments)` as defined in the subsequent section, using
/// the same downwards context as the original expression.
/// ...
/// The static type of the constructor invocation in this case is the fully
/// instantiated on-type of `E` - that is, the on-type of `E` with the inferred
/// type arguments of the fully resolved invocation substituted for the type
/// parameters of `E`.
///
/// @description Checks that type inference for `C.name(arguments)` and
/// `C(arguments)` is performed on `E.name(arguments)` using the same downwards
/// context as the original expression, and that the static type of the
/// invocation is the fully instantiated on-type of `E`.
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

extension ExtC2 on C<num, String> {
  factory foo() => C<num, String>._(num);
}

extension ExtM<T> on M<T, T> {
  factory fromList(List<T> _) => MO<T, T>._(T);
  factory(List<T> _) => MO<T, T>._(T);
}

extension ExtM2 on M<num, String> {
  factory foo() => MO<num, String>._(num);
}

extension ExtMC<T> on MC<T, T> {
  factory fromList(List<T> _) => MC<T, T>._()..t = T;
  factory(List<T> _) => MC<T, T>._()..t = T;
}

extension ExtMC2 on MC<num, String> {
  factory foo() => MC<num, String>._()..t = num;
}

extension ExtET<T> on ET<T, T> {
  factory fromList(List<T> _) => ET<T, T>._(T);
  factory(List<T> _) => ET<T, T>._(T);
}

extension ExtET2 on ET<num, String> {
  factory foo() => ET<num, String>._(num);
}

main() {
  // There is no context type, so `T` is inferred from the argument and it is
  // `int`. The static type is the instantiated on-type `C<int, int>`.
  var c1 = C.fromList([1]);
  c1.expectStaticType<Exactly<C<int, int>>>();
  Expect.equals(int, c1.t);
  // The same as above, but for the unnamed constructor.
  var c2 = C([1]);
  c2.expectStaticType<Exactly<C<int, int>>>();
  Expect.equals(int, c2.t);
  // The downwards context `C<num?, Object>` of the original expression is used.
  // `C<T, T> <: C<num?, Object>` gives `T <: num?` and `T <: Object`, so `T` is
  // `num` and not `int`, and `[1]` is inferred as `<num>[1]`.
  C<num?, Object> c3 = C.fromList([1]);
  Expect.equals(num, c3.t);
  // The same as above, but for the unnamed constructor.
  C<num?, Object> c4 = C([1]);
  Expect.equals(num, c4.t);
  // There is no context type, `T` is inferred from the type of the argument.
  var c5 = C.fromList(<num>[]);
  c5.expectStaticType<Exactly<C<num, num>>>();
  Expect.equals(num, c5.t);
  // `ExtC2` is not generic, so the static type is its on-type.
  var c6 = C.foo();
  c6.expectStaticType<Exactly<C<num, String>>>();
  Expect.equals(num, c6.t);

  var m1 = M.fromList([1]);
  m1.expectStaticType<Exactly<M<int, int>>>();
  Expect.equals(int, m1.t);
  var m2 = M([1]);
  m2.expectStaticType<Exactly<M<int, int>>>();
  Expect.equals(int, m2.t);
  M<num?, Object> m3 = M.fromList([1]);
  Expect.equals(num, m3.t);
  M<num?, Object> m4 = M([1]);
  Expect.equals(num, m4.t);
  var m5 = M.fromList(<num>[]);
  m5.expectStaticType<Exactly<M<num, num>>>();
  Expect.equals(num, m5.t);
  var m6 = M.foo();
  m6.expectStaticType<Exactly<M<num, String>>>();
  Expect.equals(num, m6.t);

  var mc1 = MC.fromList([1]);
  mc1.expectStaticType<Exactly<MC<int, int>>>();
  Expect.equals(int, mc1.t);
  var mc2 = MC([1]);
  mc2.expectStaticType<Exactly<MC<int, int>>>();
  Expect.equals(int, mc2.t);
  MC<num?, Object> mc3 = MC.fromList([1]);
  Expect.equals(num, mc3.t);
  MC<num?, Object> mc4 = MC([1]);
  Expect.equals(num, mc4.t);
  var mc5 = MC.fromList(<num>[]);
  mc5.expectStaticType<Exactly<MC<num, num>>>();
  Expect.equals(num, mc5.t);
  var mc6 = MC.foo();
  mc6.expectStaticType<Exactly<MC<num, String>>>();
  Expect.equals(num, mc6.t);

  var et1 = ET.fromList([1]);
  et1.expectStaticType<Exactly<ET<int, int>>>();
  Expect.equals(int, et1.t);
  var et2 = ET([1]);
  et2.expectStaticType<Exactly<ET<int, int>>>();
  Expect.equals(int, et2.t);
  ET<num?, Object> et3 = ET.fromList([1]);
  Expect.equals(num, et3.t);
  ET<num?, Object> et4 = ET([1]);
  Expect.equals(num, et4.t);
  var et5 = ET.fromList(<num>[]);
  et5.expectStaticType<Exactly<ET<num, num>>>();
  Expect.equals(num, et5.t);
  var et6 = ET.foo();
  et6.expectStaticType<Exactly<ET<num, String>>>();
  Expect.equals(num, et6.t);
}
