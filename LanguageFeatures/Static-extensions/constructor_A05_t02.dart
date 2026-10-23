// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration is generic, the type parameters
/// declared by the extension are in scope in any constructors declared in the
/// extension (just as with a constructor declared in a generic class).
///
/// @description Checks that the type parameters declared by an extension are in
/// scope in a redirecting factory constructor declared in the extension. Test
/// that they can be used in the formal parameter list and in the redirection
/// target of the constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<T> {
  final Type t;
  final T v;
  C(this.v) : t = T;
}

extension ExtC<T> on C<T> {
  factory foo(T v) = C<T>.new;
}

mixin M<T> {
  Type get t;
  T get v;
}

class MO<T> with M<T> {
  final Type t;
  final T v;
  MO(this.v) : t = T;
}

extension ExtM<T> on M<T> {
  factory foo(T v) = MO<T>.new;
}

mixin class MC<T> {
  Type t = Never;
  T? v;
  MC();
  factory MC.named(T v) => MC<T>()
    ..t = T
    ..v = v;
}

extension ExtMC<T> on MC<T> {
  factory foo(T v) = MC<T>.named;
}

extension type ET<T>((Type, T) r) {
  ET.named(T v) : this((T, v));
  Type get t => r.$1;
  T get v => r.$2;
}

extension ExtET<T> on ET<T> {
  factory foo(T v) = ET<T>.named;
}

main() {
  var c = C<int>.foo(1);
  c.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c.t);
  Expect.equals(1, c.v);

  var m = M<int>.foo(2);
  m.expectStaticType<Exactly<M<int>>>();
  Expect.isTrue(m is MO<int>);
  Expect.equals(int, m.t);
  Expect.equals(2, m.v);

  var mc = MC<int>.foo(3);
  mc.expectStaticType<Exactly<MC<int>>>();
  Expect.equals(int, mc.t);
  Expect.equals(3, mc.v);

  var et = ET<int>.foo(4);
  et.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(int, et.t);
  Expect.equals(4, et.v);
}
