// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`X1 & B1`, `T2`) =
///   - `T2` if `X1 <: T2`
///   - otherwise `X1` if `T2` <: `X1`
///   - otherwise UP(`B1a`, `T2`) where `B1a` is the greatest closure of `B1`
///     with respect to `X1`, as defined in inference.md.
///
/// @description Check that UP(`X1 & B1`, `T2`) = `T2` if `T2 != X1 & B1`,
/// not TOP(`T2`), `T2` is not an intersection type, not BOTTOM(`T2`) and
/// `X1 <: T2`. We also use the fact that TOP(`X1 & B1`) never holds.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

// ignore_for_file: dead_code

class A {}
class B1 extends A {}

void f1<T2, X1 extends T2>(X1 x1, T2 t2) {
  if (x1 is B1) { // `x1` promoted to `X1 & B1`.
    var v = (1 > 2) ? x1 : t2; // UP(X1 & B1, T2) = T2 because X1 <: T2
    v.expectStaticType<Exactly<T2>>();
  }
}

void f2<T2 extends A, X1 extends T2>(X1 x1, T2 t2) {
  if (x1 is B1) { // `x1` promoted to `X1 & B1`.
    var v = (1 > 2) ? x1 : t2; // UP(X1 & B1, T2) = T2 because X1 <: T2
    v.expectStaticType<Exactly<T2>>();
  }
}

void main() {
  f1<num, int>(1, 2);
  f2<A, B1>(B1(), A());
}
