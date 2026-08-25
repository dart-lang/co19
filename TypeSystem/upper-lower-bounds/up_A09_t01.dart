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
/// @description Check that UP(`T1`, `X2 & B2`) = `X2` if `T1 != X2 & B2`,
/// not TOP(`T1`), `T1` is not  an intersection type, not BOTTOM(`T1`) and
/// `T1 <: X2`. We also use the fact that TOP(`X2 & B2`) never holds.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// ignore_for_file: dead_code

class A {}
class B2 extends A {}

void f1<X2, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void f2<X2 extends A, T1 extends X2>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = X2 because T1 <: X2
    v.expectStaticType<Exactly<X2>>();
  }
}

void main() {
  f1<num, int>(1, 2);
  f2<A, B2>(B2(), A());
}
