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
/// @description Check that if `S` is `FutureOr<T>` then the least closure of
/// `S` with respect to `L` is `FutureOr<U>` where `U` is the least closure of
/// `T` with respect to `L`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';

test1<
  X extends void Function(FutureOr<int>),
  Y extends void Function(FutureOr<int>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

test2<
  X extends void Function(FutureOr<num?>),
  Y extends void Function(FutureOr<num?>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(FutureOr<num?>)>>();
}

test3<
  X extends void Function(FutureOr<Null>),
  Y extends void Function(FutureOr<Null>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(FutureOr<Null>)>>();
}

main() {
  test1((FutureOr<int> _) {}, (FutureOr<int> _) {});
  test2((FutureOr<num?> _) {}, (FutureOr<num?> _) {});
  test3((FutureOr<Null> _) {}, (FutureOr<Null> _) {});
}
