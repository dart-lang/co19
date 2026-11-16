// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a fully resolved reference ("tearoff") of a constructor
/// declared in an extension of the form `E.name` or `E<TypeArguments>.name`. We
/// say that the "un-instantiated function type" of the constructor reference is
/// `M Function(Signature)` where `M` is the un-instantiated on-type of the
/// extension, and `Signature` is the parameter signature of the constructor
/// (that is, the types of the positional parameters, and the types and names of
/// the named parameters). Note that any type parameters declared by the
/// extension occur free in the un-instantiated function type of the
/// constructor. In the case that the extension declares type parameters
/// `TypeParameters`, we further say that the "fully generic function type" of
/// the constructor reference is `M Function<TypeParameters>(Signature)`.
/// ...
/// A fully resolved reference ("tearoff") with explicitly provided type
/// arguments (`E<TypeArguments>.name`) to a constructor declared in an
/// extension with type parameters `TypeParameters`, is subject to no further
/// inference to reconstruct the type arguments.
///
/// The static type of such a reference is the un-instantiated function type of
/// the constructor reference with `TypeArguments` substituted throughout for
/// `TypeParameters`.
///
/// @description Checks that the static type of the tearoff
/// `E<TypeArguments>.name` is the un-instantiated function type of the
/// constructor reference with `TypeArguments` substituted for the type
/// parameters of `E`.
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
  // `T` is provided explicitly and it is substituted into the un-instantiated
  // function type `C<T, T> Function(List<T>)`.
  var cf1 = ExtC<int>.fromList;
  cf1.expectStaticType<Exactly<C<int, int> Function(List<int>)>>();
  Expect.equals(int, cf1([1]).t);
  // The same as above, but for the unnamed constructor and `num`.
  var cf2 = ExtC<num>.new;
  cf2.expectStaticType<Exactly<C<num, num> Function(List<num>)>>();
  Expect.equals(num, cf2([1]).t);
  // `T` is provided explicitly, so the context type has no effect on it.
  C<Object, Object> Function(List<int>) cf3 = ExtC<int>.fromList;
  Expect.equals(int, cf3([1]).t);
  // `T` is also substituted into the function type in the on-type of `ExtC3`.
  var cf4 = ExtC3<int>.bar;
  cf4.expectStaticType<Exactly<C<int, void Function(int)> Function()>>();
  Expect.equals(int, cf4().t);

  var mf1 = ExtM<int>.fromList;
  mf1.expectStaticType<Exactly<M<int, int> Function(List<int>)>>();
  Expect.equals(int, mf1([1]).t);
  var mf2 = ExtM<num>.new;
  mf2.expectStaticType<Exactly<M<num, num> Function(List<num>)>>();
  Expect.equals(num, mf2([1]).t);
  M<Object, Object> Function(List<int>) mf3 = ExtM<int>.fromList;
  Expect.equals(int, mf3([1]).t);
  var mf4 = ExtM3<int>.bar;
  mf4.expectStaticType<Exactly<M<int, void Function(int)> Function()>>();
  Expect.equals(int, mf4().t);

  var mcf1 = ExtMC<int>.fromList;
  mcf1.expectStaticType<Exactly<MC<int, int> Function(List<int>)>>();
  Expect.equals(int, mcf1([1]).t);
  var mcf2 = ExtMC<num>.new;
  mcf2.expectStaticType<Exactly<MC<num, num> Function(List<num>)>>();
  Expect.equals(num, mcf2([1]).t);
  MC<Object, Object> Function(List<int>) mcf3 = ExtMC<int>.fromList;
  Expect.equals(int, mcf3([1]).t);
  var mcf4 = ExtMC3<int>.bar;
  mcf4.expectStaticType<Exactly<MC<int, void Function(int)> Function()>>();
  Expect.equals(int, mcf4().t);

  var etf1 = ExtET<int>.fromList;
  etf1.expectStaticType<Exactly<ET<int, int> Function(List<int>)>>();
  Expect.equals(int, etf1([1]).t);
  var etf2 = ExtET<num>.new;
  etf2.expectStaticType<Exactly<ET<num, num> Function(List<num>)>>();
  Expect.equals(num, etf2([1]).t);
  ET<Object, Object> Function(List<int>) etf3 = ExtET<int>.fromList;
  Expect.equals(int, etf3([1]).t);
  var etf4 = ExtET3<int>.bar;
  etf4.expectStaticType<Exactly<ET<int, void Function(int)> Function()>>();
  Expect.equals(int, etf4().t);
}
