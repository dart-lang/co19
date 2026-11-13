// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declares type parameters `TypeParameters` and no
/// type arguments are provided to a fully resolved reference, then the context
/// type, if any, may induce implicitly provided type arguments as with
/// references to normal constructors ("an implicit partial instantiation").
/// Coercion inference is performed using the downwards context `K`, exactly as
/// if the reference were to a function whose type were the generic function
/// type of the constructor reference (as defined above).
///
/// If this coercion inference process results in type arguments being inferred
/// for the extension, then the static type of the reference is the
/// un-instantiated function type of the constructor reference with
/// `TypeArguments` substituted throughout for `TypeParameters`.
///
/// @description Checks that if `E` is generic, then the context type of the
/// tearoff `E.name` induces implicitly provided type arguments of `E`, and the
/// static type of the tearoff is the un-instantiated function type of the
/// constructor reference with these type arguments substituted for the type
/// parameters of `E`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

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
  // The tearoff is treated as having the type `C<T, T> Function<T>(List<T>)`.
  // The context return type gives `T <: num` and `T <: int`, the context
  // parameter type gives `int <: T`, so `T` is `int`. The type of the tearoff
  // is `C<int, int> Function(List<int>)` and not the context type.
  C<num, int> Function(List<int>) cf1 = ExtC.fromList;
  Expect.equals(int, cf1([1]).t);
  Expect.isTrue(cf1 is C<int, int> Function(List<int>));
  // The same for the unnamed constructor. The context return type gives
  // `T <: num?` and `T <: Object`, the context parameter type gives `num <: T`,
  // so `T` is `num`.
  C<num?, Object> Function(List<num>) cf2 = ExtC.new;
  Expect.equals(num, cf2([1]).t);
  Expect.isTrue(cf2 is C<num, num> Function(List<num>));
  // `T` occurs in `void Function(T)` contravariantly, so the context gives
  // `T <: num` and `int <: T`, and `T` is `int`.
  C<num, void Function(int)> Function() cf3 = ExtC3.bar;
  Expect.equals(int, cf3().t);

  M<num, int> Function(List<int>) mf1 = ExtM.fromList;
  Expect.equals(int, mf1([1]).t);
  Expect.isTrue(mf1 is M<int, int> Function(List<int>));
  M<num?, Object> Function(List<num>) mf2 = ExtM.new;
  Expect.equals(num, mf2([1]).t);
  Expect.isTrue(mf2 is M<num, num> Function(List<num>));
  M<num, void Function(int)> Function() mf3 = ExtM3.bar;
  Expect.equals(int, mf3().t);

  MC<num, int> Function(List<int>) mcf1 = ExtMC.fromList;
  Expect.equals(int, mcf1([1]).t);
  Expect.isTrue(mcf1 is MC<int, int> Function(List<int>));
  MC<num?, Object> Function(List<num>) mcf2 = ExtMC.new;
  Expect.equals(num, mcf2([1]).t);
  Expect.isTrue(mcf2 is MC<num, num> Function(List<num>));
  MC<num, void Function(int)> Function() mcf3 = ExtMC3.bar;
  Expect.equals(int, mcf3().t);

  ET<num, int> Function(List<int>) etf1 = ExtET.fromList;
  Expect.equals(int, etf1([1]).t);
  Expect.isTrue(etf1 is ET<int, int> Function(List<int>));
  ET<num?, Object> Function(List<num>) etf2 = ExtET.new;
  Expect.equals(num, etf2([1]).t);
  Expect.isTrue(etf2 is ET<num, num> Function(List<num>));
  ET<num, void Function(int)> Function() etf3 = ExtET3.bar;
  Expect.equals(int, etf3().t);
}
