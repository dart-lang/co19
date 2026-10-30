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
/// used as the downwards context for inferring the type arguments to the
/// redirectee of a redirecting factory constructor declared in the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {
  Type get t => X;
}

class D<X> extends C<X> {}

class DList<X> extends C<List<X>> {
  Type get elementType => X;
}

extension ExtC<T> on C<T> {
  factory foo() = C.new;
  factory bar() = D.new;
}

extension ExtCList<T> on C<List<T>> {
  factory baz() = C.new;
  factory qux() = DList.new;
}

mixin M<X> {
  Type get t => X;
}

class MO<X> = Object with M<X>;

extension ExtM<T> on M<T> {
  factory foo() = MO.new;
}

mixin class MC<X> {
  Type get t => X;
}

extension ExtMC<T> on MC<T> {
  factory foo() = MC.new;
}

extension type ET<X>(int _) {
  Type get t => X;
}

extension ExtET<T> on ET<T> {
  factory foo(int v) = ET.new;
}

main() {
  var c1 = C<int>.foo();
  c1.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c1.t);
  var c2 = C<int>.bar();
  c2.expectStaticType<Exactly<C<int>>>();
  Expect.isTrue(c2 is D<int>);
  Expect.equals(int, c2.t);

  var c3 = C<List<int>>.baz();
  c3.expectStaticType<Exactly<C<List<int>>>>();
  Expect.equals(List<int>, c3.t);
  var c4 = C<List<int>>.qux();
  c4.expectStaticType<Exactly<C<List<int>>>>();
  Expect.isTrue(c4 is DList<int>);
  Expect.equals(List<int>, c4.t);
  Expect.equals(int, (c4 as DList).elementType);

  var m = M<int>.foo();
  m.expectStaticType<Exactly<M<int>>>();
  Expect.isTrue(m is MO<int>);
  Expect.equals(int, m.t);

  var mc = MC<int>.foo();
  mc.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc.t);

  var et = ET<int>.foo(0);
  et.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et.t);

  // No type arguments and no context type. The type parameter of the extension
  // is not constrained, so it is `dynamic`.
  var c5 = C.foo();
  c5.expectStaticType<Exactly<C<dynamic>>>();
  Expect.equals(dynamic, c5.t);
  var c6 = C.bar();
  c6.expectStaticType<Exactly<C<dynamic>>>();
  Expect.isTrue(c6 is D<dynamic>);
  Expect.equals(dynamic, c6.t);

  var c7 = C.baz();
  c7.expectStaticType<Exactly<C<List<dynamic>>>>();
  Expect.equals(List<dynamic>, c7.t);
  var c8 = C.qux();
  c8.expectStaticType<Exactly<C<List<dynamic>>>>();
  Expect.isTrue(c8 is DList<dynamic>);
  Expect.equals(List<dynamic>, c8.t);
  Expect.equals(dynamic, (c8 as DList).elementType);

  var m2 = M.foo();
  m2.expectStaticType<Exactly<M<dynamic>>>();
  Expect.isTrue(m2 is MO<dynamic>);
  Expect.equals(dynamic, m2.t);

  var mc2 = MC.foo();
  mc2.expectStaticType<Exactly<MC<dynamic>>>();
  Expect.equals(dynamic, mc2.t);

  var et2 = ET.foo(0);
  et2.expectStaticType<Exactly<ET<dynamic>>>();
  Expect.equals(dynamic, et2.t);
}
