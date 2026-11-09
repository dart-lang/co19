// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a constructor tearoff of the form
/// `C<TypeArguments>.name` or `C<TypeArguments>.new`, where `E.name` is the
/// fully resolved target for the constructor. Let `M` be the un-instantiated
/// on-type of `E` and let `Signature` be the parameter signature of `E.name`.
/// ...
/// Otherwise, let `TypeParameters1` be the type parameters declared by `E`.
/// Type inference for the tearoff is performed by subtyping matching
/// `M <# C<TypeArguments>` solving for `TypeParameters1`.
/// ...
/// Let `TypeArguments1` be the solution for `TypeParameters1` derived above,
/// let `M1` be `M` with `TypeArguments1` substituted for `TypeParameters1` and
/// let `Signature1` be `Signature` with `TypeArguments1` substituted for
/// `TypeParameters1`.
///
/// The static type of the constructor tearoff is
/// `C<TypeArguments> Function(Signature1)`.
///
/// @description Checks that if `E` is generic, then type arguments of `E` for
/// the tearoff `C<TypeArguments>.name` are obtained by subtype matching
/// `M <# C<TypeArguments>`, and that the static type of the tearoff is
/// `C<TypeArguments> Function(Signature1)`.
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

extension ExtC3<T> on C<T, void Function(T)> {
  factory bar() => C<T, void Function(T)>._(T);
}

extension ExtM<T> on M<T, T> {
  factory fromList(List<T> _) => MO<T, T>._(T);
  factory(List<T> _) => MO<T, T>._(T);
}

extension ExtM3<T> on M<T, void Function(T)> {
  factory bar() => MO<T, void Function(T)>._(T);
}

extension ExtMC<T> on MC<T, T> {
  factory fromList(List<T> _) => MC<T, T>._()..t = T;
  factory(List<T> _) => MC<T, T>._()..t = T;
}

extension ExtMC3<T> on MC<T, void Function(T)> {
  factory bar() => MC<T, void Function(T)>._()..t = T;
}

extension ExtET<T> on ET<T, T> {
  factory fromList(List<T> _) => ET<T, T>._(T);
  factory(List<T> _) => ET<T, T>._(T);
}

extension ExtET3<T> on ET<T, void Function(T)> {
  factory bar() => ET<T, void Function(T)>._(T);
}

main() {
  // `C<T, T> <# C<num, int>` gives `T <: num` and `T <: int`, so `T` is `int`.
  // The return type of the tearoff is `C<TypeArguments>` and not the
  // instantiated on-type `C<int, int>`.
  var cf1 = C<num, int>.fromList;
  cf1.expectStaticType<Exactly<C<num, int> Function(List<int>)>>();
  Expect.equals(int, cf1([1]).t);
  // The same as above, but for the unnamed constructor.
  var cf2 = C<num, int>.new;
  cf2.expectStaticType<Exactly<C<num, int> Function(List<int>)>>();
  Expect.equals(int, cf2([1]).t);
  // `C<T, T> <# C<int, num>` gives `T <: int` and `T <: num`, so `T` is `int`.
  var cf3 = C<int, num>.fromList;
  cf3.expectStaticType<Exactly<C<int, num> Function(List<int>)>>();
  Expect.equals(int, cf3([1]).t);
  // `C<T, T> <# C<int, String>` gives `T <: int` and `T <: String`. These types
  // are unrelated, so `T` is `Never` and the parameter type is `List<Never>`.
  var cf4 = C<int, String>.new;
  cf4.expectStaticType<Exactly<C<int, String> Function(List<Never>)>>();
  Expect.equals(Never, cf4([]).t);
  // `T` occurs in `void Function(T)` contravariantly, so
  // `C<T, void Function(T)> <# C<num, void Function(num)>` gives `T <: num` and
  // `num <: T`, and `T` is `num`.
  var cf5 = C<num, void Function(num)>.bar;
  cf5.expectStaticType<Exactly<C<num, void Function(num)> Function()>>();
  Expect.equals(num, cf5().t);

  var mf1 = M<num, int>.fromList;
  mf1.expectStaticType<Exactly<M<num, int> Function(List<int>)>>();
  Expect.equals(int, mf1([1]).t);
  var mf2 = M<num, int>.new;
  mf2.expectStaticType<Exactly<M<num, int> Function(List<int>)>>();
  Expect.equals(int, mf2([1]).t);
  var mf3 = M<int, num>.fromList;
  mf3.expectStaticType<Exactly<M<int, num> Function(List<int>)>>();
  Expect.equals(int, mf3([1]).t);
  var mf4 = M<int, String>.new;
  mf4.expectStaticType<Exactly<M<int, String> Function(List<Never>)>>();
  Expect.equals(Never, mf4([]).t);
  var mf5 = M<num, void Function(num)>.bar;
  mf5.expectStaticType<Exactly<M<num, void Function(num)> Function()>>();
  Expect.equals(num, mf5().t);

  var mcf1 = MC<num, int>.fromList;
  mcf1.expectStaticType<Exactly<MC<num, int> Function(List<int>)>>();
  Expect.equals(int, mcf1([1]).t);
  var mcf2 = MC<num, int>.new;
  mcf2.expectStaticType<Exactly<MC<num, int> Function(List<int>)>>();
  Expect.equals(int, mcf2([1]).t);
  var mcf3 = MC<int, num>.fromList;
  mcf3.expectStaticType<Exactly<MC<int, num> Function(List<int>)>>();
  Expect.equals(int, mcf3([1]).t);
  var mcf4 = MC<int, String>.new;
  mcf4.expectStaticType<Exactly<MC<int, String> Function(List<Never>)>>();
  Expect.equals(Never, mcf4([]).t);
  var mcf5 = MC<num, void Function(num)>.bar;
  mcf5.expectStaticType<Exactly<MC<num, void Function(num)> Function()>>();
  Expect.equals(num, mcf5().t);

  var etf1 = ET<num, int>.fromList;
  etf1.expectStaticType<Exactly<ET<num, int> Function(List<int>)>>();
  Expect.equals(int, etf1([1]).t);
  var etf2 = ET<num, int>.new;
  etf2.expectStaticType<Exactly<ET<num, int> Function(List<int>)>>();
  Expect.equals(int, etf2([1]).t);
  var etf3 = ET<int, num>.fromList;
  etf3.expectStaticType<Exactly<ET<int, num> Function(List<int>)>>();
  Expect.equals(int, etf3([1]).t);
  var etf4 = ET<int, String>.new;
  etf4.expectStaticType<Exactly<ET<int, String> Function(List<Never>)>>();
  Expect.equals(Never, etf4([]).t);
  var etf5 = ET<num, void Function(num)>.bar;
  etf5.expectStaticType<Exactly<ET<num, void Function(num)> Function()>>();
  Expect.equals(num, etf5().t);
}
