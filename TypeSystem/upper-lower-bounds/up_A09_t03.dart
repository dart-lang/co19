// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `X2 & B2`) =
///   - `X2` if `T1 <: X2`
///   - otherwise `T1` if `X2 <: T1`
///   - otherwise UP(`T1`, `B2a`) where `B2a` is the greatest closure of `B2`
///     with respect to `X2`, as defined in inference.md.
///
/// @description Check that UP(`T1`, `X2 & B2`) = UP(`T1`, `B2a`) where `B2a` is
/// the greatest closure of `B2` with respect to `X2` if the first two
/// conditions are not met and also `T1 != X2 & B2`, TOP(`T1`) `== false`,
/// BOTTOM(`T1`) `== false`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';

class A {}
class T1 extends A {}
class B2 extends A {}
class X2 extends A {}

void f1(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    // UP(T1, X2 & B2) = UP(T1, B2a), where B2a is
    // the greatest closure of `B2` with respect to `X2`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<A>>();
  }
}

void f2<TT1 extends A, XX2 extends A>(TT1 t1, XX2 x2) {
  if (x2 is B2) { // `x2` promoted to `XX2 & B2`.
    // UP(TT1, XX2 & B2) = UP(TT1, B2a), where `B2a` is
    // the greatest closure of `B2` with respect to `XX2`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<A>>();
  }
}

void f3(T1? t1, X2? x2) {
  if (x2 is B2) { // `x2` promoted to `X2? & B2`.
    // UP(T1?, X2? & B2) = UP(T1?, B2a), where `B2a` is
    // the greatest closure of `B2` with respect to `X2`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<A?>>();
  }
}

void f4((T1,) t1, (X2,) x2) {
  if (x2 is B2) { // `x2` promoted to `(X2,) & B2`.
    // UP((T1,), (X2,) & B2) = UP((T1,), B2a), where `B2a` is
    // the greatest closure of `B2` with respect to `(X2,)`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<(A,)>>();
  }
}

void f5(FutureOr<T1> t1, FutureOr<X2> x2) {
  if (x2 is B2) { // `x2` promoted to `FutureOr<X2> & B2`.
    // UP(FutureOr<T1>, FutureOr<X2> & B2) = UP(FutureOr<T1>, B2a), where B2a is
    // the greatest closure of `B2` with respect to `FutureOr<X2>`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<FutureOr<A>>>();
  }
}

void f6(T1 Function() t1, X2 Function() x2) {
  if (x2 is B2) { // `x2` promoted to `X2 Function() & B2`.
    // UP(T1 Function(), X2 Function() & B2) = UP(T1 Function(), B2a), where B2a
    // is the greatest closure of `B2` with respect to `X2 Function()`.
    var v = (1 > 2) ? t1 : x2;
    v.expectStaticType<Exactly<A Function()>>();
  }
}

void main() {
  f1(T1(), X2());
  f2(T1(), X2());
  f3(T1(), null);
  f4((T1(),), (X2(),));
  f5(T1(), Future.value(X2()));
  f6(() => T1(), () => X2());
}
