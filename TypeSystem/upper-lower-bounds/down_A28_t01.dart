// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `FutureOr<T2>`) = `S`
///   where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`T1`, `FutureOr<T2>`) = `S` where `S` is
/// DOWN(`T1`, `T2`). `T1` is not `Future` or `FutureOr`, neither `T1` nor
/// `FutureOr<T2>` is a subtype of the other, and neither is TOP or OBJECT.
/// Note that `FutureOr<...>` is never BOTTOM, NULL, a type of the form `U?`, a
/// type variable, `Function`, a function type, `Record`, or a record type.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(num) v1, void Function(FutureOr<int>) v2) {
  // num <: FutureOr<int> is false because num <: int is false.
  // DOWN(num, int) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int)>>();
}

void f2(void Function(num) v1, void Function(FutureOr<int?>) v2) {
  // DOWN(num, int?) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int)>>();
}

void f3(void Function((num,)) v1, void Function(FutureOr<(int?,)>) v2) {
  // DOWN((num,), (int?,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int,))>>();
}

void f4(
  void Function((num, {Object s})) v1,
  void Function(FutureOr<(int?, {String s})>) v2,
) {
  // DOWN((num, {Object s}), (int?, {String s})) = (int, {String s})
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int, {String s}))>>();
}

void f5(
  void Function(num Function(num)) v1,
  void Function(FutureOr<int Function(int)>) v2,
) {
  // Neither function type is a subtype of the other.
  // DOWN(num Function(num), int Function(int)) = int Function(num)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function(num))>>();
}

void f6(
  void Function(D<num, Object>) v1,
  void Function(FutureOr<D<int, String>>) v2,
) {
  // DOWN(D<num, Object>, D<int, String>) = D<int, String>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(D<int, String>)>>();
}

void f7(void Function((num,)) v1, void Function(FutureOr<(int,)>) v2) {
  // (num,) <: FutureOr<(int,)> is false.
  // DOWN((num,), (int,)) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int,))>>();
}

void f8(
  void Function(Iterable<num>) v1,
  void Function(FutureOr<List<int>>) v2,
) {
  // Iterable<num> <: FutureOr<List<int>> is false.
  // DOWN(Iterable<num>, List<int>) = List<int>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(List<int>)>>();
}

void f9(void Function(ET) v1, void Function(FutureOr<ET2>) v2) {
  // ET <: FutureOr<ET2> is false.
  // DOWN(ET, ET2) = ET2
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET2)>>();
}

void f10<X extends num>(void Function(num) v1, void Function(FutureOr<X>) v2) {
  // num <: FutureOr<X> is false.
  // DOWN(num, X) = X
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(X)>>();
}

void f11(
  void Function(Function) v1,
  void Function(FutureOr<int Function()>) v2,
) {
  // Function <: FutureOr<int Function()> is false.
  // DOWN(Function, int Function()) = int Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function())>>();
}

void f12(
  void Function(num Function<X extends num>(num)) v1,
  void Function(FutureOr<int Function<X extends num>(X)>) v2,
) {
  // DOWN(num Function<X extends num>(num), int Function<X extends num>(X)) =
  // int Function<X extends num>(num)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function<X extends num>(num))>>();
}

void f13(
  void Function(Function) v1,
  void Function(FutureOr<int Function<X extends num>(X)>) v2,
) {
  // DOWN(Function, int Function<X extends num>(X)) =
  // int Function<X extends num>(X)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function<X extends num>(X))>>();
}

void f14(
    void Function(String Function<X extends num>(X)) v1,
    void Function(FutureOr<int Function<X extends num>(X)>) v2,
    ) {
  // DOWN(String Function<X extends num>(X), int Function<X extends num>(X)) =
  // Never Function<X extends num>(X)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never Function<X extends num>(X))>>();
}

void f15(
    void Function((String, int)) v1,
    void Function(FutureOr<(int, String)>) v2,
    ) {
  // Same shape, but neither record is a subtype of the other.
  // DOWN((String, int), (int, String)) = (Never, Never)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never, Never))>>();
}

void f16(
    void Function(String Function()) v1,
    void Function(FutureOr<int Function()>) v2,
    ) {
  // DOWN(String Function(), int Function()) = Never Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never Function())>>();
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
  f10<int>((x) {}, (x) {});
  f11((x) {}, (x) {});
  f12((x) {}, (x) {});
  f13((x) {}, (x) {});
  f14((x) {}, (x) {});
  f15((x) {}, (x) {});
  f16((x) {}, (x) {});
}
