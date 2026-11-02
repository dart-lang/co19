// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If this invocation does not include actual type arguments and
/// the extension declares one or more type parameters then the invocation is
/// subject to type inference to reconstruct the type arguments.
///
/// @description Checks that if an invocation of the form `E.name(arguments)`
/// does not include actual type arguments, and the type parameters of the
/// extension are not constrained by the context type or by the actual
/// arguments, then the type parameters are instantiated to their bounds.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {
  Type get t => X;
}

mixin M<X> {
  Type get t => X;
}

class MO<X> with M<X> {}

mixin class MC<X> {
  Type get t => X;
}

enum E<X> {
  e0<int>(),
  e1<num>(),
  e2<List<num>>();

  Type get t => X;
}

extension type ET<X>(int id) {
  Type get t => X;
}

extension ExtC1<T extends num> on C<T> {
  factory named() => C<T>();
}

extension ExtC2<T extends num> on C<List<T>> {
  factory named() => C<List<T>>();
}

extension ExtM1<T extends num> on M<T> {
  factory named() => MO<T>();
}

extension ExtM2<T extends num> on M<List<T>> {
  factory named() => MO<List<T>>();
}

extension ExtMC1<T extends num> on MC<T> {
  factory named() => MC<T>();
}

extension ExtMC2<T extends num> on MC<List<T>> {
  factory named() => MC<List<T>>();
}

extension ExtE1<T extends num> on E<T> {
  factory named() => E.values.firstWhere((e) => e.t == T) as E<T>;
}

extension ExtE2<T extends num> on E<List<T>> {
  factory named() =>
      E.values.firstWhere((e) => e.t == List<T>) as E<List<T>>;
}

extension ExtET1<T extends num> on ET<T> {
  factory named() => ET<T>(0);
}

extension ExtET2<T extends num> on ET<List<T>> {
  factory named() => ET<List<T>>(0);
}

main() {
  var c1 = ExtC1.named();
  c1.expectStaticType<Exactly<C<num>>>();
  Expect.equals(num, c1.t);
  var c2 = ExtC2.named();
  c2.expectStaticType<Exactly<C<List<num>>>>();
  Expect.equals(List<num>, c2.t);
  Object c3 = ExtC1.named();
  Expect.equals(num, (c3 as C).t);

  var m1 = ExtM1.named();
  m1.expectStaticType<Exactly<M<num>>>();
  Expect.equals(num, m1.t);
  var m2 = ExtM2.named();
  m2.expectStaticType<Exactly<M<List<num>>>>();
  Expect.equals(List<num>, m2.t);
  Object m3 = ExtM1.named();
  Expect.equals(num, (m3 as M).t);

  var mc1 = ExtMC1.named();
  mc1.expectStaticType<Exactly<MC<num>>>();
  Expect.equals(num, mc1.t);
  var mc2 = ExtMC2.named();
  mc2.expectStaticType<Exactly<MC<List<num>>>>();
  Expect.equals(List<num>, mc2.t);
  Object mc3 = ExtMC1.named();
  Expect.equals(num, (mc3 as MC).t);

  var e1 = ExtE1.named();
  e1.expectStaticType<Exactly<E<num>>>();
  Expect.equals(E.e1, e1);
  var e2 = ExtE2.named();
  e2.expectStaticType<Exactly<E<List<num>>>>();
  Expect.equals(E.e2, e2);
  Object e3 = ExtE1.named();
  Expect.equals(E.e1, e3);

  var et1 = ExtET1.named();
  et1.expectStaticType<Exactly<ET<num>>>();
  Expect.equals(num, et1.t);
  var et2 = ExtET2.named();
  et2.expectStaticType<Exactly<ET<List<num>>>>();
  Expect.equals(List<num>, et2.t);
}
