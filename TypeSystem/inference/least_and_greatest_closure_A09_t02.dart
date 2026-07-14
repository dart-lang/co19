// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is `FutureOr<T>`
///   - The least closure of `S` with respect to `L` is `FutureOr<U>` where `U`
///     is the least closure of `T` with respect to `L`
///   - The greatest closure of `S` with respect to `L` is `FutureOr<U>` where
///     `U` is the greatest closure of `T` with respect to `L`
///
/// @description Check that if `S` is `FutureOr<T>` then the greatest closure of
/// `S` with respect to `L` is `FutureOr<U>` where `U` is the greatest closure
/// of `T` with respect to `L`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';

test1<X extends FutureOr<int>, Y extends FutureOr<int>>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<FutureOr<int>>>();
}

test2<X extends FutureOr<num?>, Y extends FutureOr<num?>>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<FutureOr<num?>>>();
}

test3<X extends FutureOr<Null>, Y extends FutureOr<Null>>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<FutureOr<Null>>>();
}

main() {
  test1(Future.value(1), 2);
  test2(Future.value(null), 3.14);
  test3(Future.value(null), null);
}
