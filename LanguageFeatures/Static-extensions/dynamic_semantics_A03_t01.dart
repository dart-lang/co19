// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Declarations of non-redirecting constructors defined in
/// extensions can be thought of semantically as declarations of static methods
/// with return type given by the on-type of the extension; type parameters (if
/// any) given by the type parameters of the extension (including bounds); and
/// parameter signature as given in the declaration.
///
/// Evaluation of a fully resolved invocation of a non-redirecting construcutor
/// is done in the same manner as evaluation of an induced static method as
/// described above. If the extension (and hence the induced static method for
/// the constructor) is generic, then type arguments to the invocation are
/// either taken from the original invocation if provided explicitly
/// (`E<Types>.name(arguments)`) or as reconstructed via inference in the manner
/// described above if not provided explicitly (`E.name(arguments)`).
///
/// @description Checks that a non-redirecting constructor declared in a generic
/// extension is evaluated as a static generic method with the type parameters
/// (including bounds) of the extension. Test that if no type arguments are
/// provided and nothing constrains them, then the bounds are used. Test that a
/// dynamic invocation of a tearoff of such constructor with type arguments that
/// don't satisfy the bounds, or with wrong arguments, throws.
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

extension ExtC<T extends num> on C<T, T> {
  factory fromList([List<T>? _]) => C<T, T>._(T);
  factory([List<T>? _]) => C<T, T>._(T);
}

extension ExtM<T extends num> on M<T, T> {
  factory fromList([List<T>? _]) => MO<T, T>._(T);
  factory([List<T>? _]) => MO<T, T>._(T);
}

extension ExtMC<T extends num> on MC<T, T> {
  factory fromList([List<T>? _]) => MC<T, T>._()..t = T;
  factory([List<T>? _]) => MC<T, T>._()..t = T;
}

extension ExtET<T extends num> on ET<T, T> {
  factory fromList([List<T>? _]) => ET<T, T>._(T);
  factory([List<T>? _]) => ET<T, T>._(T);
}

main() {
  var c1 = C.fromList();
  Expect.equals(num, c1.t);
  var c2 = ExtC.new();
  Expect.equals(num, c2.t);
  var c3 = ExtC<int>.fromList();
  Expect.equals(int, c3.t);
  dynamic cf1 = ExtC.fromList;
  Expect.equals(num, cf1().t);
  Expect.equals(num, cf1(<num>[]).t);
  Expect.equals(int, cf1<int>().t);
  Expect.throws(() => cf1<String>());
  Expect.throws(() => cf1<int>(<num>[]));
  Expect.throws(() => cf1(["x"]));
  dynamic cf2 = ExtC.new;
  Expect.equals(double, cf2<double>().t);
  Expect.throws(() => cf2<Object>());

  var m1 = M.fromList();
  Expect.equals(num, m1.t);
  var m2 = ExtM.new();
  Expect.equals(num, m2.t);
  var m3 = ExtM<int>.fromList();
  Expect.equals(int, m3.t);
  dynamic mf1 = ExtM.fromList;
  Expect.equals(num, mf1().t);
  Expect.equals(num, mf1(<num>[]).t);
  Expect.equals(int, mf1<int>().t);
  Expect.throws(() => mf1<String>());
  Expect.throws(() => mf1<int>(<num>[]));
  Expect.throws(() => mf1(["x"]));
  dynamic mf2 = ExtM.new;
  Expect.equals(double, mf2<double>().t);
  Expect.throws(() => mf2<Object>());

  var mc1 = MC.fromList();
  Expect.equals(num, mc1.t);
  var mc2 = ExtMC.new();
  Expect.equals(num, mc2.t);
  var mc3 = ExtMC<int>.fromList();
  Expect.equals(int, mc3.t);
  dynamic mcf1 = ExtMC.fromList;
  Expect.equals(num, mcf1().t);
  Expect.equals(num, mcf1(<num>[]).t);
  Expect.equals(int, mcf1<int>().t);
  Expect.throws(() => mcf1<String>());
  Expect.throws(() => mcf1<int>(<num>[]));
  Expect.throws(() => mcf1(["x"]));
  dynamic mcf2 = ExtMC.new;
  Expect.equals(double, mcf2<double>().t);
  Expect.throws(() => mcf2<Object>());

  var et1 = ET.fromList();
  Expect.equals(num, et1.t);
  var et2 = ExtET.new();
  Expect.equals(num, et2.t);
  var et3 = ExtET<int>.fromList();
  Expect.equals(int, et3.t);
  dynamic etf1 = ExtET.fromList;
  Expect.equals(num, etf1().t);
  Expect.equals(num, etf1(<num>[]).t);
  Expect.equals(int, etf1<int>().t);
  Expect.throws(() => etf1<String>());
  Expect.throws(() => etf1<int>(<num>[]));
  Expect.throws(() => etf1(["x"]));
  dynamic etf2 = ExtET.new;
  Expect.equals(double, etf2<double>().t);
  Expect.throws(() => etf2<Object>());
}
