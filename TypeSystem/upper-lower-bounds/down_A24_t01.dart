// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`FutureOr<T1>`, `FutureOr<T2>`) = `FutureOr<S>`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`FutureOr<T1>`, `FutureOr<T2>`) = `FutureOr<S>`
/// where `S` is DOWN(`T1`, `T2`). Neither `FutureOr<T1>` nor `FutureOr<T2>` is
/// a subtype of the other, and neither is TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(FutureOr<int?>) v1, void Function(FutureOr<num>) v2) {
  // int? <: num is false, so the FutureOr types are not subtypes.
  // DOWN(int?, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f2(void Function(FutureOr<num>) v1, void Function(FutureOr<int?>) v2) {
  // DOWN(num, int?) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int>)>>();
}

void f3(
  void Function(FutureOr<(int?,)>) v1,
  void Function(FutureOr<(num,)>) v2,
) {
  // (int?,) <: (num,) is false.
  // DOWN((int?,), (num,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<(int,)>)>>();
}

void f4(
  void Function(FutureOr<(int?, {String s})>) v1,
  void Function(FutureOr<(num, {Object s})>) v2,
) {
  // DOWN((int?, {String s}), (num, {Object s})) = (int, {String s})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<(int, {String s})>)>>();
}

void f5(
  void Function(FutureOr<int Function(int)>) v1,
  void Function(FutureOr<num Function(num)>) v2,
) {
  // Neither function type is a subtype of the other.
  // DOWN(int Function(int), num Function(num)) = int Function(num)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<int Function(num)>)>>();
}

void f6(
  void Function(FutureOr<D<int, String>>) v1,
  void Function(FutureOr<D<num, Object>>) v2,
) {
  // DOWN(D<int, String>, D<num, Object>) = D<int, String>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<D<int, String>>)>>();
}

void f7(
  void Function(FutureOr<int Function<X extends num>(X)>) v1,
  void Function(FutureOr<num Function<X extends num>(num)>) v2,
) {
  // Neither generic function type is a subtype of the other.
  // DOWN(int Function<X extends num>(X), num Function<X extends num>(num)) =
  // int Function<X extends num>(num)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
        Exactly<void Function(FutureOr<int Function<X extends num>(num)>)>>();
}

void f8<X>(void Function(FutureOr<X>) v1, void Function(FutureOr<num>) v2) {
  // DOWN(X, num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Never>)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8<num>((x) {}, (x) {});
}
