// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`Future<T1>`, `FutureOr<T2>`) = `Future<S>`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`Future<T1>`, `FutureOr<T2>`) = `Future<S>`
/// where `S` is DOWN(`T1`, `T2`). Neither `Future<T1>` nor `FutureOr<T2>` is a
/// subtype of the other, and neither is TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(Future<num>) v1, void Function(FutureOr<int>) v2) {
  // Future<num> <: FutureOr<int> is false because num <: int is false.
  // DOWN(num, int) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f2(void Function(Future<num>) v1, void Function(FutureOr<int?>) v2) {
  // DOWN(num, int?) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f3(void Function(Future<int?>) v1, void Function(FutureOr<num>) v2) {
  // DOWN(int?, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f4(void Function(Future<(num,)>) v1, void Function(FutureOr<(int?,)>) v2) {
  // DOWN((num,), (int?,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(int,)>)>>();
}

void f5(
  void Function(Future<(num, {Object s})>) v1,
  void Function(FutureOr<(int?, {String s})>) v2,
) {
  // DOWN((num, {Object s}), (int?, {String s})) = (int, {String s})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(int, {String s})>)>>();
}

void f6(
  void Function(Future<num Function(num)>) v1,
  void Function(FutureOr<int Function(int)>) v2,
) {
  // DOWN(num Function(num), int Function(int)) = int Function(num)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int Function(num)>)>>();
}

void f7(
  void Function(Future<D<num, Object>>) v1,
  void Function(FutureOr<D<int, String>>) v2,
) {
  // DOWN(D<num, Object>, D<int, String>) = D<int, String>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<D<int, String>>)>>();
}

void f8(void Function(Future<(num,)>) v1, void Function(FutureOr<(int,)>) v2) {
  // Future<(num,)> <: FutureOr<(int,)> is false.
  // DOWN((num,), (int,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<(int,)>)>>();
}

void f9(
  void Function(Future<Iterable<num>>) v1,
  void Function(FutureOr<List<int>>) v2,
) {
  // Future<Iterable<num>> <: FutureOr<List<int>> is false.
  // DOWN(Iterable<num>, List<int>) = List<int>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<List<int>>)>>();
}

void f10(void Function(Future<ET>) v1, void Function(FutureOr<ET2>) v2) {
  // Future<ET> <: FutureOr<ET2> is false.
  // DOWN(ET, ET2) = ET2
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<ET2>)>>();
}

void f11<X extends num>(
  void Function(Future<num>) v1,
  void Function(FutureOr<X>) v2,
) {
  // Future<num> <: FutureOr<X> is false.
  // DOWN(num, X) = X
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<X>)>>();
}

void f12(
  void Function(Future<Function>) v1,
  void Function(FutureOr<int Function()>) v2,
) {
  // DOWN(Function, int Function()) = int Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int Function()>)>>();
}

void f13(
  void Function(Future<num Function<X extends num>(num)>) v1,
  void Function(FutureOr<int Function<X extends num>(X)>) v2,
) {
  // DOWN(num Function<X extends num>(num), int Function<X extends num>(X)) =
  // int Function<X extends num>(num)
  var v = (1 > 2) ? v1 : v2;
  v
      .expectStaticType<
        Exactly<void Function(Future<int Function<X extends num>(num)>)>
      >();
}

void f14(
  void Function(Future<Function>) v1,
  void Function(FutureOr<int Function<X extends num>(X)>) v2,
) {
  // DOWN(Function, int Function<X extends num>(X)) =
  // int Function<X extends num>(X)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<
        Exactly<void Function(Future<int Function<X extends num>(X)>)>>();
}

void f15<X>(void Function(Future<num>) v1, void Function(FutureOr<X>) v2) {
  // DOWN(num, X) = Never
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
