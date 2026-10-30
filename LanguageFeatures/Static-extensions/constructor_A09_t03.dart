// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a factory constructor declared in
/// an extension has an inferred return type which is not a subtype of the
/// on-type of the extension (after inference has been performed).
///
/// @description Checks that it is not an error if a non-redirecting factory
/// constructor declared in an extension returns a value whose type is a subtype
/// of the un-instantiated on-type of the extension.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<X> {
  Type get t => X;
}

class D<X> extends C<X> {}

class DList<X> extends C<List<X>> {}

mixin M<X> {
  Type get t => X;
}

class MO<X> = Object with M<X>;

mixin class MC<X> {
  Type get t => X;
}

class MC1<X> extends MC<X> {}

enum E<X> {
  e0<int>(),
  e1<String>();

  Type get t => X;
}

extension type ET<X>(int _) {
  Type get t => X;
}

extension type ET1<X>(int _) implements ET<X> {}

extension ExtC<T> on C<T> {
  factory foo() => D<T>();
  factory bar(bool b) {
    if (b) {
      return D();
    }
    return C();
  }
  factory baz() => throw 42;
}

extension ExtCList<T> on C<List<T>> {
  factory foo() => DList<T>();
}

extension ExtM<T> on M<T> {
  factory foo() => MO<T>();
}

extension ExtMC<T> on MC<T> {
  factory foo() {
    return MC1<T>();
  }
}

extension ExtE<T> on E<T> {
  factory foo() => E.values.firstWhere((e) => e.t == T) as E<T>;
}

extension ExtET<T> on ET<T> {
  factory foo(int v) => ET1<T>(v);
}

main() {
  var c1 = C<int>.foo();
  c1.expectStaticType<Exactly<C<int>>>();
  Expect.isTrue(c1 is D<int>);
  var c2 = C<int>.bar(true);
  c2.expectStaticType<Exactly<C<int>>>();
  Expect.isTrue(c2 is D<int>);
  Expect.equals(int, c2.t); // If `c2` is `D<Never>` we'll catch it here
  var c3 = C<int>.bar(false);
  c3.expectStaticType<Exactly<C<int>>>();
  Expect.equals(int, c3.t);
  Expect.throws(() => C<int>.baz());

  var c4 = C<List<int>>.foo();
  c4.expectStaticType<Exactly<C<List<int>>>>();
  Expect.isTrue(c4 is DList<int>);

  var m = M<int>.foo();
  m.expectStaticType<Exactly<M<int>>>();
  Expect.isTrue(m is MO<int>);

  var mc = MC<int>.foo();
  mc.expectStaticType<Exactly<MC<int>>>();
  Expect.isTrue(mc is MC1<int>);

  var e = E<String>.foo();
  e.expectStaticType<Exactly<E<String>>>();
  Expect.equals(E.e1, e);

  var et = ET<int>.foo(1);
  et.expectStaticType<Exactly<ET<int>>>();
  Expect.equals(1, et as int);
}
