// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`FutureOr<T1>`, `Future<T2>`) = `Future<S>`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`FutureOr<T1>`, `Future<T2>`) = `Future<S>`
/// where `S` is DOWN(`T1`, `T2`). Neither `FutureOr<T1>` nor `Future<T2>` is a
/// subtype of the other, and neither is TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(FutureOr<int>) v1, void Function(Future<num>) v2) {
  // Future<num> <: FutureOr<int> is false because num <: int is false.
  // DOWN(int, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f2(void Function(FutureOr<int?>) v1, void Function(Future<num>) v2) {
  // DOWN(int?, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f3(void Function(FutureOr<num>) v1, void Function(Future<int?>) v2) {
  // DOWN(num, int?) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f4(void Function(FutureOr<(int?,)>) v1, void Function(Future<(num,)>) v2) {
  // DOWN((int?,), (num,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(int,)>)>>();
}

void f5(
  void Function(FutureOr<(int?, {String s})>) v1,
  void Function(Future<(num, {Object s})>) v2,
) {
  // DOWN((int?, {String s}), (num, {Object s})) = (int, {String s})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(int, {String s})>)>>();
}

void f6(
  void Function(FutureOr<int Function(int)>) v1,
  void Function(Future<num Function(num)>) v2,
) {
  // DOWN(int Function(int), num Function(num)) = int Function(num)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int Function(num)>)>>();
}

void f7(
  void Function(FutureOr<D<int, String>>) v1,
  void Function(Future<D<num, Object>>) v2,
) {
  // DOWN(D<int, String>, D<num, Object>) = D<int, String>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<D<int, String>>)>>();
}

void f8(void Function(FutureOr<(int,)>) v1, void Function(Future<(num,)>) v2) {
  // Future<(num,)> <: FutureOr<(int,)> is false.
  // DOWN((int,), (num,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(int,)>)>>();
}

void f9(
  void Function(FutureOr<List<int>>) v1,
  void Function(Future<Iterable<num>>) v2,
) {
  // Future<Iterable<num>> <: FutureOr<List<int>> is false.
  // DOWN(List<int>, Iterable<num>) = List<int>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<List<int>>)>>();
}

void f10(void Function(FutureOr<ET2>) v1, void Function(Future<ET>) v2) {
  // Future<ET> <: FutureOr<ET2> is false.
  // DOWN(ET2, ET) = ET2
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<ET2>)>>();
}

void f11<X extends num>(
  void Function(FutureOr<X>) v1,
  void Function(Future<num>) v2,
) {
  // Future<num> <: FutureOr<X> is false.
  // DOWN(X, num) = X
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<X>)>>();
}

void f12(
  void Function(FutureOr<int Function()>) v1,
  void Function(Future<Function>) v2,
) {
  // Future<Function> <: FutureOr<int Function()> is false.
  // DOWN(int Function(), Function) = int Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int Function()>)>>();
}

void f13(
  void Function(FutureOr<int Function<X extends num>(X)>) v1,
  void Function(Future<num Function<X extends num>(num)>) v2,
) {
  // DOWN(int Function<X extends num>(X), num Function<X extends num>(num)) =
  // int Function<X extends num>(num)
  var v = (1 > 2) ? v1 : v2;
  v
      .expectStaticType<
        Exactly<void Function(Future<int Function<X extends num>(num)>)>
      >();
}

void f14(
  void Function(FutureOr<int Function<X extends num>(X)>) v1,
  void Function(Future<Function>) v2,
) {
  // Future<Function> <: FutureOr<int Function<X extends num>(X)> is false.
  // DOWN(int Function<X extends num>(X), Function) =
  // int Function<X extends num>(X)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
        Exactly<void Function(Future<int Function<X extends num>(X)>)>>();
}

void f15<X>(void Function(FutureOr<X>) v1, void Function(Future<num>) v2) {
  // DOWN(X, num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<Never>)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
  f8((x) {}, (x) {});
  f9((x) {}, (x) {});
  f10((x) {}, (x) {});
  f11<int>((x) {}, (x) {});
  f12((x) {}, (x) {});
  f13((x) {}, (x) {});
  f14((x) {}, (x) {});
  f15<num>((x) {}, (x) {});
}
