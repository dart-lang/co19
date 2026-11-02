// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If this invocation does not include actual type arguments and
/// the extension declares one or more type parameters then the invocation is
/// subject to type inference to reconstruct the type arguments.
///
/// @description Checks that if an invocation of the form `E.name(arguments)`
/// does not include actual type arguments, then the type arguments of the
/// extension are inferred from the context type. Test the case when the on-type
/// of the extension is not just `D<T>`, where `T` is a type parameter of the
/// extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C<X> {
  Type get t => X;
}

class D<X, Y> {
  Type get tx => X;
  Type get ty => Y;
}

mixin M<X> {
  Type get t => X;
}

class MO<X> with M<X> {}

mixin class MC<X> {
  Type get t => X;
}

enum E<X> {
  e0<List<int>>(),
  e1<List<String>>();

  Type get t => X;
}

extension type ET<X>(int id) {
  Type get t => X;
}

extension ExtC<T> on C<List<T>> {
  factory named() => C<List<T>>();
}

extension ExtD1<T> on D<T, T> {
  factory named() => D<T, T>();
}

extension ExtD2<K, V> on D<V, K> {
  factory named() => D<V, K>();
}

extension ExtM<T> on M<List<T>> {
  factory named() => MO<List<T>>();
}

extension ExtMC<T> on MC<List<T>> {
  factory named() => MC<List<T>>();
}

extension ExtE<T> on E<List<T>> {
  factory named() =>
      E.values.firstWhere((e) => e.t == List<T>) as E<List<T>>;
}

extension ExtET<T> on ET<List<T>> {
  factory named(int id) => ET<List<T>>(id);
}

main() {
  C<List<int>> c1 = ExtC.named();
  Expect.equals(List<int>, c1.t);

  // `List<T>` is a subtype of `Object` for any `T`, so `T` is not constrained.
  Object c2 = ExtC.named();
  Expect.equals(List<dynamic>, (c2 as C).t);

  D<num, num> d1 = ExtD1.named();
  Expect.equals(num, d1.tx);
  Expect.equals(num, d1.ty);

  // `T <: num` and `T <: int`, so `T` is `int`.
  D<num, int> d2 = ExtD1.named();
  Expect.equals(int, d2.tx);
  Expect.equals(int, d2.ty);

  D<int, String> d3 = ExtD2.named();
  Expect.equals(int, d3.tx);
  Expect.equals(String, d3.ty);

  M<List<int>> m = ExtM.named();
  Expect.equals(List<int>, m.t);

  MC<List<int>> mc = ExtMC.named();
  Expect.equals(List<int>, mc.t);

  E<List<int>> e0 = ExtE.named();
  Expect.equals(E.e0, e0);
  E<List<String>> e1 = ExtE.named();
  Expect.equals(E.e1, e1);

  ET<List<int>> et = ExtET.named(1);
  Expect.equals(List<int>, et.t);
}
