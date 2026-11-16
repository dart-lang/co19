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
/// ...
/// If this coercion inference process results in no type arguments being
/// inferred for the extension, then the static type of the reference is the
/// fully generic function type of the constructor reference.
///
/// @description Checks that if `E` is generic and no type arguments of `E` are
/// inferred for the tearoff `E.name`, then the static type of the tearoff is
/// the fully generic function type of the constructor reference.
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
  // There is no context type, so no type arguments are inferred. The static
  // type is the fully generic function type.
  var cf1 = ExtC.fromList;
  cf1.expectStaticType<Exactly<C<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, cf1<String>([]).t);
  // The same as above, but for the unnamed constructor.
  var cf2 = ExtC.new;
  cf2.expectStaticType<Exactly<C<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, cf2<String>([]).t);
  // The context type is generic, so the tearoff is not instantiated.
  C<T, T> Function<T>(List<T>) cf3 = ExtC.fromList;
  Expect.equals(String, cf3<String>([]).t);
  // The same as for `cf1`, but `T` also occurs in the function type in the
  // on-type of `ExtC3`.
  var cf4 = ExtC3.bar;
  cf4.expectStaticType<Exactly<C<T, void Function(T)> Function<T>()>>();
  Expect.equals(String, cf4<String>().t);
  // The context type `Object` is not a function type, so no type arguments are
  // inferred and the value of `cf5` is a generic function.
  Object cf5 = ExtC.fromList;
  Expect.isTrue(cf5 is C<T, T> Function<T>(List<T>));

  var mf1 = ExtM.fromList;
  mf1.expectStaticType<Exactly<M<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mf1<String>([]).t);
  var mf2 = ExtM.new;
  mf2.expectStaticType<Exactly<M<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mf2<String>([]).t);
  M<T, T> Function<T>(List<T>) mf3 = ExtM.fromList;
  Expect.equals(String, mf3<String>([]).t);
  var mf4 = ExtM3.bar;
  mf4.expectStaticType<Exactly<M<T, void Function(T)> Function<T>()>>();
  Expect.equals(String, mf4<String>().t);
  Object mf5 = ExtM.fromList;
  Expect.isTrue(mf5 is M<T, T> Function<T>(List<T>));

  var mcf1 = ExtMC.fromList;
  mcf1.expectStaticType<Exactly<MC<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mcf1<String>([]).t);
  var mcf2 = ExtMC.new;
  mcf2.expectStaticType<Exactly<MC<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, mcf2<String>([]).t);
  MC<T, T> Function<T>(List<T>) mcf3 = ExtMC.fromList;
  Expect.equals(String, mcf3<String>([]).t);
  var mcf4 = ExtMC3.bar;
  mcf4.expectStaticType<Exactly<MC<T, void Function(T)> Function<T>()>>();
  Expect.equals(String, mcf4<String>().t);
  Object mcf5 = ExtMC.fromList;
  Expect.isTrue(mcf5 is MC<T, T> Function<T>(List<T>));

  var etf1 = ExtET.fromList;
  etf1.expectStaticType<Exactly<ET<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, etf1<String>([]).t);
  var etf2 = ExtET.new;
  etf2.expectStaticType<Exactly<ET<T, T> Function<T>(List<T>)>>();
  Expect.equals(String, etf2<String>([]).t);
  ET<T, T> Function<T>(List<T>) etf3 = ExtET.fromList;
  Expect.equals(String, etf3<String>([]).t);
  var etf4 = ExtET3.bar;
  etf4.expectStaticType<Exactly<ET<T, void Function(T)> Function<T>()>>();
  Expect.equals(String, etf4<String>().t);
  Object etf5 = ExtET.fromList;
  Expect.isTrue(etf5 is ET<T, T> Function<T>(List<T>));
}
