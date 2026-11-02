// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If this invocation does not include actual type arguments and
/// the extension declares one or more type parameters then the invocation is
/// subject to type inference to reconstruct the type arguments.
///
/// @description Checks that if an invocation of the form `E.name(arguments)`
/// does not include actual type arguments, then the type arguments of the
/// extension are inferred from the actual arguments of the invocation, and
/// from both the context type and the actual arguments.
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
  e2<Object>(),
  e3<String>();

  Type get t => X;
}

extension type ET<X>(int id) {
  Type get t => X;
}

extension ExtC<T> on C<T> {
  factory two(T v1, T v2) => C<T>();
  factory fromList(List<T> l) => C<T>();
  factory fromFunc(T Function() f) => C<T>();
  factory fromNamed({required T v}) => C<T>();
}

extension ExtM<T> on M<T> {
  factory two(T v1, T v2) => MO<T>();
  factory fromList(List<T> l) => MO<T>();
  factory fromFunc(T Function() f) => MO<T>();
  factory fromNamed({required T v}) => MO<T>();
}

extension ExtMC<T> on MC<T> {
  factory two(T v1, T v2) => MC<T>();
  factory fromList(List<T> l) => MC<T>();
  factory fromFunc(T Function() f) => MC<T>();
  factory fromNamed({required T v}) => MC<T>();
}

extension ExtE<T> on E<T> {
  factory two(T v1, T v2) => E.values.firstWhere((e) => e.t == T) as E<T>;
  factory fromList(List<T> l) =>
      E.values.firstWhere((e) => e.t == T) as E<T>;
  factory fromFunc(T Function() f) =>
      E.values.firstWhere((e) => e.t == T) as E<T>;
  factory fromNamed({required T v}) =>
      E.values.firstWhere((e) => e.t == T) as E<T>;
}

extension ExtET<T> on ET<T> {
  factory two(T v1, T v2) => ET<T>(0);
  factory fromList(List<T> l) => ET<T>(0);
  factory fromFunc(T Function() f) => ET<T>(0);
  factory fromNamed({required T v}) => ET<T>(0);
}

main() {
  var c1 = ExtC.two(1, 2.0);
  c1.expectStaticType<Exactly<C<num>>>();
  Expect.equals(num, c1.t);
  var c2 = ExtC.two(1, "2");
  c2.expectStaticType<Exactly<C<Object>>>();
  Expect.equals(Object, c2.t);
  var c3 = ExtC.fromList([1, 2]);
  c3.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c3.t);
  var c4 = ExtC.fromFunc(() => "s");
  c4.expectStaticType<Exactly<C<String>>>();
  Expect.equals(String, c4.t);
  var c5 = ExtC.fromNamed(v: 1);
  c5.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c5.t);
  // The context type takes precedence, `[1]` is inferred as `<num>[1]`.
  C<num> c6 = ExtC.fromList([1]);
  Expect.equals(num, c6.t);
  C<Object> c7 = ExtC.fromFunc(() => 1);
  Expect.equals(Object, c7.t);

  var m1 = ExtM.two(1, 2.0);
  m1.expectStaticType<Exactly<M<num>>>();
  Expect.equals(num, m1.t);
  var m2 = ExtM.fromList(["1"]);
  m2.expectStaticType<Exactly<M<String>>>();
  Expect.equals(String, m2.t);
  var m3 = ExtM.fromFunc(() => 1);
  m3.expectStaticType<Exactly<M<int>>>();
  Expect.equals(int, m3.t);
  var m4 = ExtM.fromNamed(v: "s");
  m4.expectStaticType<Exactly<M<String>>>();
  Expect.equals(String, m4.t);
  M<num> m5 = ExtM.fromList([1]);
  Expect.equals(num, m5.t);

  var mc1 = ExtMC.two(1, 2.0);
  mc1.expectStaticType<Exactly<MC<num>>>();
  Expect.equals(num, mc1.t);
  var mc2 = ExtMC.fromList(["1"]);
  mc2.expectStaticType<Exactly<MC<String>>>();
  Expect.equals(String, mc2.t);
  var mc3 = ExtMC.fromFunc(() => 1);
  mc3.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc3.t);
  var mc4 = ExtMC.fromNamed(v: "s");
  mc4.expectStaticType<Exactly<MC<String>>>();
  Expect.equals(String, mc4.t);
  MC<num> mc5 = ExtMC.fromList([1]);
  Expect.equals(num, mc5.t);

  var e1 = ExtE.two(1, 2);
  e1.expectStaticType<Exactly<E<int>>>();
  Expect.equals(E.e0, e1);
  var e2 = ExtE.two(1, 2.0);
  e2.expectStaticType<Exactly<E<num>>>();
  Expect.equals(E.e1, e2);
  var e3 = ExtE.two(1, "2");
  e3.expectStaticType<Exactly<E<Object>>>();
  Expect.equals(E.e2, e3);
  var e4 = ExtE.fromList(["1"]);
  e4.expectStaticType<Exactly<E<String>>>();
  Expect.equals(E.e3, e4);
  var e5 = ExtE.fromFunc(() => 1);
  e5.expectStaticType<Exactly<E<int>>>();
  Expect.equals(E.e0, e5);
  var e6 = ExtE.fromNamed(v: "s");
  e6.expectStaticType<Exactly<E<String>>>();
  Expect.equals(E.e3, e6);
  E<num> e7 = ExtE.fromList([1]);
  Expect.equals(E.e1, e7);

  var et1 = ExtET.two(1, 2.0);
  et1.expectStaticType<Exactly<ET<num>>>();
  Expect.equals(num, et1.t);
  var et2 = ExtET.fromList(["1"]);
  et2.expectStaticType<Exactly<ET<String>>>();
  Expect.equals(String, et2.t);
  var et3 = ExtET.fromFunc(() => 1);
  et3.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et3.t);
  var et4 = ExtET.fromNamed(v: "s");
  et4.expectStaticType<Exactly<ET<String>>>();
  Expect.equals(String, et4.t);
  ET<num> et5 = ExtET.fromList([1]);
  Expect.equals(num, et5.t);
}
