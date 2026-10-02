// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`(S0, ... Sk, {T0 d0, ..., Tn dn})`,
///      `(S0', ... Sk', {T0' d0, ..., Tn' dn})`) =
///   `(Q0, ...,Qk, {R0, ..., Rn})` if:
///     - `Qi` is DOWN(`Si`, `Si'`)
///     - `Ri` is DOWN(`Ti`, `Ti'`)
///
/// @description Check that DOWN of two record types with the same shape is a
/// record type of that shape where each field type is DOWN of the corresponding
/// field types.
/// Note that no earlier rule applies because record types are never TOP, OBJECT,
/// NULL, BOTTOM, types of the form `T?`, type variables, function types, or
/// `Function`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function(()) v1, void Function(()) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(())>>();
}

void f2(void Function((int,)) v1, void Function((num,)) v2) {
  // DOWN((int,), (num,)) = (DOWN(int, num),) = (int,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int,))>>();
}

void f3(void Function((int, String)) v1, void Function((num, Object)) v2) {
  // DOWN((int, String), (num, Object)) = (int, String)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int, String))>>();
}

void f4(void Function((num?, String)) v1, void Function((int, Object?)) v2) {
  // DOWN(num?, int) = int, DOWN(String, Object?) = String
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int, String))>>();
}

void f5(void Function(({int i})) v1, void Function(({num i})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(({int i}))>>();
}

void f6(
  void Function(({int i, String s})) v1,
  void Function(({num i, Object s})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(({int i, String s}))>>();
}

void f7(
  void Function((int, {String s})) v1,
  void Function((num, {Object s})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int, {String s}))>>();
}

void f8(void Function(Rec2) v1, void Function(Rec) v2) {
  // Rec2 = (int, String, {bool b}), Rec = (num, Pattern, {bool b})
  // DOWN(...) = Rec2
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Rec2)>>();
}

void f9(
  void Function((int, (String,))) v1,
  void Function((num, (Object,))) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int, (String,)))>>();
}

void f10(void Function((int?,)) v1, void Function((num,)) v2) {
  // DOWN(int?, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int,))>>();
}

void f11(void Function((FutureOr<int>,)) v1, void Function((num,)) v2) {
  // DOWN(FutureOr<int>, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int,))>>();
}

void f12(void Function((E,)) v1, void Function((Object,)) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((E,))>>();
}

void f13<X extends num>(void Function((X,)) v1, void Function((num,)) v2) {
  // DOWN(X, num) = X
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((X,))>>();
}

void f14(
  void Function((Function, {int Function() x})) v1,
  void Function((int Function(), {num Function() x})) v2,
) {
  // DOWN(Function, int Function()) = int Function()
  // DOWN(int Function(), num Function()) = int Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((int Function(), {int Function() x}))>>();
}

void f15(void Function((E, {ET? x})) v1, void Function((E?, {ET x})) v2) {
  // DOWN(E, E?) = E, DOWN(ET?, ET) = ET
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((E, {ET x}))>>();
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
  f11((x) {}, (x) {});
  f12((x) {}, (x) {});
  f13<int>((x) {}, (x) {});
  f14((x) {}, (x) {});
  f15((x) {}, (x) {});
}
