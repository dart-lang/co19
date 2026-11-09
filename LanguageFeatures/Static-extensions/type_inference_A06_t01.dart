// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a constructor tearoff of the form `C.name` or `C`, where
/// `E.name` is the fully resolved target of the constructor.
/// ...
/// Type inference for such a tearoff is done by performing inference on the
/// tearoff `E.name` as defined in a subsequent section, using the same
/// downwards context as the original expression.
/// ...
/// The static type of the constructor tearoff in this case is the static type
/// of the fully resolved tearoff as determined a subsequent section.
///
/// @description Checks that type inference for `C.name` and `C.new` is
/// performed on the tearoff `E.name` using the same downwards context as the
/// original expression, and that the static type of the tearoff is the static
/// type of the fully resolved tearoff.
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
  // There is no context type, so the tearoff is a generic function whose type
  // parameter is the type parameter of `ExtC`.
  var cf1 = C.fromList;
  cf1.expectStaticType<Exactly<C<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, cf1<String>([]).t);
  // The same as above, but for the unnamed constructor.
  var cf2 = C.new;
  cf2.expectStaticType<Exactly<C<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, cf2<String>([]).t);
  // The tearoff is instantiated using the context type. The return type gives
  // `T <: num` and `T <: int`, the parameter type gives `int <: T`, so `T` is
  // `int`.
  C<num, int> Function(List<int>) cf3 = C.fromList;
  Expect.equals(int, cf3([1]).t);
  // The same for the unnamed constructor. The return type gives `T <: num?` and
  // `T <: Object`, the parameter type gives `num <: T`, so `T` is `num`.
  C<num?, Object> Function(List<num>) cf4 = C.new;
  Expect.equals(num, cf4([1]).t);
  // `ExtC2` is not generic, so the return type is its on-type.
  var cf5 = C.foo;
  cf5.expectStaticType<Exactly<C<int, String> Function()>>();
  Expect.equals(int, cf5().t);

  var mf1 = M.fromList;
  mf1.expectStaticType<Exactly<M<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mf1<String>([]).t);
  var mf2 = M.new;
  mf2.expectStaticType<Exactly<M<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mf2<String>([]).t);
  M<num, int> Function(List<int>) mf3 = M.fromList;
  Expect.equals(int, mf3([1]).t);
  M<num?, Object> Function(List<num>) mf4 = M.new;
  Expect.equals(num, mf4([1]).t);
  var mf5 = M.foo;
  mf5.expectStaticType<Exactly<M<int, String> Function()>>();
  Expect.equals(int, mf5().t);

  var mcf1 = MC.fromList;
  mcf1.expectStaticType<Exactly<MC<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mcf1<String>([]).t);
  var mcf2 = MC.new;
  mcf2.expectStaticType<Exactly<MC<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mcf2<String>([]).t);
  MC<num, int> Function(List<int>) mcf3 = MC.fromList;
  Expect.equals(int, mcf3([1]).t);
  MC<num?, Object> Function(List<num>) mcf4 = MC.new;
  Expect.equals(num, mcf4([1]).t);
  var mcf5 = MC.foo;
  mcf5.expectStaticType<Exactly<MC<int, String> Function()>>();
  Expect.equals(int, mcf5().t);

  var etf1 = ET.fromList;
  etf1.expectStaticType<Exactly<ET<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, etf1<String>([]).t);
  var etf2 = ET.new;
  etf2.expectStaticType<Exactly<ET<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, etf2<String>([]).t);
  ET<num, int> Function(List<int>) etf3 = ET.fromList;
  Expect.equals(int, etf3([1]).t);
  ET<num?, Object> Function(List<num>) etf4 = ET.new;
  Expect.equals(num, etf4([1]).t);
  var etf5 = ET.foo;
  etf5.expectStaticType<Exactly<ET<int, String> Function()>>();
  Expect.equals(int, etf5().t);
}
