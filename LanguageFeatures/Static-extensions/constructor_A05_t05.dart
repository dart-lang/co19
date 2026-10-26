// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration is generic, the type parameters
/// declared by the extension are in scope in any constructors declared in the
/// extension (just as with a constructor declared in a generic class).
///
/// @description Checks that the type parameters declared by an extension shadow
/// a top-level declaration with the same name in a factory constructor declared
/// in the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class T {}

class C<X> {
  final Type t;
  final X v;
  C(this.v) : t = X;
}

extension ExtC<T> on C<T> {
  factory foo(T v) => C<T>(v);
  factory bar(T v) = C<T>.new;
}

mixin M<X> {
  Type get t;
  X get v;
}

class MO<X> with M<X> {
  final Type t;
  final X v;
  MO(this.v) : t = X;
}

extension ExtM<T> on M<T> {
  factory foo(T v) => MO<T>(v);
  factory bar(T v) = MO<T>.new;
}

mixin class MC<X> {
  Type t = Never;
  X? v;
  MC();
  factory MC.named(X v) => MC<X>()
    ..t = X
    ..v = v;
}

extension ExtMC<T> on MC<T> {
  factory foo(T v) => MC<T>.named(v);
  factory bar(T v) = MC<T>.named;
}

extension type ET<X>((Type, X) r) {
  ET.named(X v) : this((X, v));
  Type get t => r.$1;
  X get v => r.$2;
}

extension ExtET<T> on ET<T> {
  factory foo(T v) => ET<T>.named(v);
  factory bar(T v) = ET<T>.named;
}

main() {
  var c1 = C<int>.foo(1);
  c1.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c1.t);
  Expect.equals(1, c1.v);
  var c2 = C<int>.bar(2);
  c2.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c2.t);
  Expect.equals(2, c2.v);

  var m1 = M<int>.foo(3);
  m1.expectStaticType<Exactly<M<int>>>();
  Expect.equals(int, m1.t);
  Expect.equals(3, m1.v);
  var m2 = M<int>.bar(4);
  m2.expectStaticType<Exactly<M<int>>>();
  Expect.equals(int, m2.t);
  Expect.equals(4, m2.v);

  var mc1 = MC<int>.foo(5);
  mc1.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc1.t);
  Expect.equals(5, mc1.v);
  var mc2 = MC<int>.bar(6);
  mc2.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc2.t);
  Expect.equals(6, mc2.v);

  var et1 = ET<int>.foo(7);
  et1.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et1.t);
  Expect.equals(7, et1.v);
  var et2 = ET<int>.bar(8);
  et2.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et2.t);
  Expect.equals(8, et2.v);
}
