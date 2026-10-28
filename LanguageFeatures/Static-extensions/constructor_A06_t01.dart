// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration declares a factory constructor, then
/// the downwards context for the purposes of inference of the body of the
/// constructor (or for inferring the type arguments to the redirectee in the
/// case of a redirecting factory constructor) is the un-instantiated on-type of
/// the extension.
///
/// @description Checks that the un-instantiated on-type of the extension is
/// used as the downwards context for the inference of the body of a
/// non-redirecting factory constructor declared in the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {
  Type get t => X;
}

extension ExtC<T> on C<T> {
  factory foo() => C();
}

extension ExtCList<T> on C<List<T>> {
  factory bar() {
    return C();
  }
}

mixin M<X> {
  Type get t => X;
}

class MO<X> = Object with M<X>;

extension ExtM<T> on M<T> {
  factory foo() => MO();
}

mixin class MC<X> {
  Type get t => X;
}

extension ExtMC<T> on MC<T> {
  factory bar() {
    return MC();
  }
}

extension type ET<X>(int _) {
  Type get t => X;
}

extension ExtET<T> on ET<T> {
  factory foo() => ET(0);
}

main() {
  var c1 = C<int>.foo();
  c1.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c1.t);
  var c2 = C<List<int>>.bar();
  c2.expectStaticType<Exactly<C<List<int>>>>();
  Expect.equals(List<int>, c2.t);

  var m = M<int>.foo();
  m.expectStaticType<Exactly<M<int>>>();
  Expect.isTrue(m is MO<int>);
  Expect.equals(int, m.t);

  var mc = MC<int>.bar();
  mc.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc.t);

  var et = ET<int>.foo();
  et.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et.t);

  // No type arguments and no context type. The type parameter of the extension
  // is not constrained, so it is `dynamic`.
  var c3 = C.foo();
  c3.expectStaticType<Exactly<C<dynamic>>>();
  Expect.equals(dynamic, c3.t);
  var c4 = C.bar();
  c4.expectStaticType<Exactly<C<List<dynamic>>>>();
  Expect.equals(List<dynamic>, c4.t);

  var m2 = M.foo();
  m2.expectStaticType<Exactly<M<dynamic>>>();
  Expect.isTrue(m2 is MO<dynamic>);
  Expect.equals(dynamic, m2.t);

  var mc2 = MC.bar();
  mc2.expectStaticType<Exactly<MC<dynamic>>>();
  Expect.equals(dynamic, mc2.t);

  var et2 = ET.foo();
  et2.expectStaticType<Exactly<ET<dynamic>>>();
  Expect.equals(dynamic, et2.t);
}
