// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declares type parameters and no type arguments
/// are provided to a fully resolved invocation, then inference is performed as
/// follows. Let `K` be the downwards context of the invocation, and let `R` be
/// the on-type of the extension. Inference is then performed in exactly the
/// same manner as an invocation of a static generic method in context `K`, the
/// type parameters of which are the type parameters of the extension; the
/// return type of which is `R`; and the parameter types of which are the
/// declared parameter types of the constructor.
/// ...
/// The static type of the constructor invocation in this case is the fully
/// instantiated on-type of `E` - that is, the on-type of `E` with the type
/// arguments (inferred or provided) of the fully resolved invocation
/// substituted for the type parameters of `E`.
///
/// @description Checks that type arguments of `E.name(arguments)`, where `E` is
/// generic, are inferred as for an invocation of a static generic method with
/// the type parameters of `E`, return type that is the on-type of `E` and
/// parameter types of the constructor. Test that the static type of the
/// invocation is the fully instantiated on-type of `E`.
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

extension ExtM<T> on M<T, T> {
  factory fromList(List<T> _) => MO<T, T>._(T);
  factory(List<T> _) => MO<T, T>._(T);
}

extension ExtMC<T> on MC<T, T> {
  factory fromList(List<T> _) => MC<T, T>._()..t = T;
  factory(List<T> _) => MC<T, T>._()..t = T;
}

extension ExtET<T> on ET<T, T> {
  factory fromList(List<T> _) => ET<T, T>._(T);
  factory(List<T> _) => ET<T, T>._(T);
}

main() {
  // As for a static generic method `C<T, T> m<T>(List<T>)` without a context
  // type, `T` is inferred from the argument and it is `int`. The static type is
  // the instantiated on-type `C<int, int>`.
  var c1 = ExtC.fromList([1]);
  c1.expectStaticType<Exactly<C<int, int>>>();
  Expect.equals(int, c1.t);
  // The same as above, but for the unnamed constructor.
  var c2 = ExtC.new([1]);
  c2.expectStaticType<Exactly<C<int, int>>>();
  Expect.equals(int, c2.t);
  // The context `C<num?, Object>` is matched with the return type `C<T, T>`.
  // This gives `T <: num?` and `T <: Object`, so `T` is `num` and not `int`,
  // and `[1]` is inferred as `<num>[1]`.
  C<num?, Object> c3 = ExtC.fromList([1]);
  Expect.equals(num, c3.t);
  // The same as above, but for the unnamed constructor.
  C<num?, Object> c4 = ExtC.new([1]);
  Expect.equals(num, c4.t);
  // There is no context type, `T` is inferred from the type of the argument.
  var c5 = ExtC.fromList(<num>[]);
  c5.expectStaticType<Exactly<C<num, num>>>();
  Expect.equals(num, c5.t);

  var m1 = ExtM.fromList([1]);
  m1.expectStaticType<Exactly<M<int, int>>>();
  Expect.equals(int, m1.t);
  var m2 = ExtM.new([1]);
  m2.expectStaticType<Exactly<M<int, int>>>();
  Expect.equals(int, m2.t);
  M<num?, Object> m3 = ExtM.fromList([1]);
  Expect.equals(num, m3.t);
  M<num?, Object> m4 = ExtM.new([1]);
  Expect.equals(num, m4.t);
  var m5 = ExtM.fromList(<num>[]);
  m5.expectStaticType<Exactly<M<num, num>>>();
  Expect.equals(num, m5.t);

  var mc1 = ExtMC.fromList([1]);
  mc1.expectStaticType<Exactly<MC<int, int>>>();
  Expect.equals(int, mc1.t);
  var mc2 = ExtMC.new([1]);
  mc2.expectStaticType<Exactly<MC<int, int>>>();
  Expect.equals(int, mc2.t);
  MC<num?, Object> mc3 = ExtMC.fromList([1]);
  Expect.equals(num, mc3.t);
  MC<num?, Object> mc4 = ExtMC.new([1]);
  Expect.equals(num, mc4.t);
  var mc5 = ExtMC.fromList(<num>[]);
  mc5.expectStaticType<Exactly<MC<num, num>>>();
  Expect.equals(num, mc5.t);

  var et1 = ExtET.fromList([1]);
  et1.expectStaticType<Exactly<ET<int, int>>>();
  Expect.equals(int, et1.t);
  var et2 = ExtET.new([1]);
  et2.expectStaticType<Exactly<ET<int, int>>>();
  Expect.equals(int, et2.t);
  ET<num?, Object> et3 = ExtET.fromList([1]);
  Expect.equals(num, et3.t);
  ET<num?, Object> et4 = ExtET.new([1]);
  Expect.equals(num, et4.t);
  var et5 = ExtET.fromList(<num>[]);
  et5.expectStaticType<Exactly<ET<num, num>>>();
  Expect.equals(num, et5.t);
}
