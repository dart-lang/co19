// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A fully resolved invocation of a constructor declared in an
/// extension where either the extension declares no type parameters, or where
/// the invocation has type arguments explicitly provided, is subject to no
/// further inference to reconstruct the type arguments. Inference is performed
/// as usual on any arguments to the constructor with the explicit type
/// arguments used to instantiate the type parameters of the extension.
/// ...
/// The static type of the constructor invocation in this case is the fully
/// instantiated on-type of `E` - that is, the on-type of `E` with the type
/// arguments (inferred or provided) of the fully resolved invocation
/// substituted for the type parameters of `E`.
///
/// @description Checks that `E<TypeArguments>.name(arguments)` and
/// `E.name(arguments)`, where `E` is not generic, are not subject to inference
/// of the type arguments of `E`, and that the static type of the invocation is
/// the fully instantiated on-type of `E`.
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
  // `T` is provided explicitly, so `[1]` is inferred as `<num>[1]`. The static
  // type is the instantiated on-type `C<num, num>`.
  var c1 = ExtC<num>.fromList([1]);
  c1.expectStaticType<Exactly<C<num, num>>>();
  Expect.equals(num, c1.t);
  // The same as above, but for the unnamed constructor.
  var c2 = ExtC<num>.new([1]);
  c2.expectStaticType<Exactly<C<num, num>>>();
  Expect.equals(num, c2.t);
  // `T` is provided explicitly, so the context type `C<Object, Object>` has no
  // effect on it.
  C<Object, Object> c3 = ExtC<int>.fromList([1]);
  Expect.equals(int, c3.t);
  // The same as above, but for the unnamed constructor.
  C<Object, Object> c4 = ExtC<int>.new([1]);
  Expect.equals(int, c4.t);
  // `ExtC2` is not generic, so nothing is inferred and the static type is its
  // on-type.
  var c5 = ExtC2.foo();
  c5.expectStaticType<Exactly<C<int, String>>>();
  Expect.equals(int, c5.t);

  var m1 = ExtM<num>.fromList([1]);
  m1.expectStaticType<Exactly<M<num, num>>>();
  Expect.equals(num, m1.t);
  var m2 = ExtM<num>.new([1]);
  m2.expectStaticType<Exactly<M<num, num>>>();
  Expect.equals(num, m2.t);
  M<Object, Object> m3 = ExtM<int>.fromList([1]);
  Expect.equals(int, m3.t);
  M<Object, Object> m4 = ExtM<int>.new([1]);
  Expect.equals(int, m4.t);
  var m5 = ExtM2.foo();
  m5.expectStaticType<Exactly<M<int, String>>>();
  Expect.equals(int, m5.t);

  var mc1 = ExtMC<num>.fromList([1]);
  mc1.expectStaticType<Exactly<MC<num, num>>>();
  Expect.equals(num, mc1.t);
  var mc2 = ExtMC<num>.new([1]);
  mc2.expectStaticType<Exactly<MC<num, num>>>();
  Expect.equals(num, mc2.t);
  MC<Object, Object> mc3 = ExtMC<int>.fromList([1]);
  Expect.equals(int, mc3.t);
  MC<Object, Object> mc4 = ExtMC<int>.new([1]);
  Expect.equals(int, mc4.t);
  var mc5 = ExtMC2.foo();
  mc5.expectStaticType<Exactly<MC<int, String>>>();
  Expect.equals(int, mc5.t);

  var et1 = ExtET<num>.fromList([1]);
  et1.expectStaticType<Exactly<ET<num, num>>>();
  Expect.equals(num, et1.t);
  var et2 = ExtET<num>.new([1]);
  et2.expectStaticType<Exactly<ET<num, num>>>();
  Expect.equals(num, et2.t);
  ET<Object, Object> et3 = ExtET<int>.fromList([1]);
  Expect.equals(int, et3.t);
  ET<Object, Object> et4 = ExtET<int>.new([1]);
  Expect.equals(int, et4.t);
  var et5 = ExtET2.foo();
  et5.expectStaticType<Exactly<ET<int, String>>>();
  Expect.equals(int, et5.t);
}
