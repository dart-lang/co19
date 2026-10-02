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
/// @description Check that if a corresponding field pair has DOWN equal to
/// `Never`, that field of the resulting record type is `Never`.
/// Note that no earlier rule applies because record types are never TOP, OBJECT,
/// NULL, BOTTOM, types of the form `T?`, type variables, function types, or
/// `Function`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(void Function((int,)) v1, void Function((String?,)) v2) {
  // DOWN(int, String?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never,))>>();
}

void f2(void Function((ET,)) v1, void Function((Object,)) v2) {
  // `ET` is neither non-nullable nor nullable; DOWN(ET, Object) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never,))>>();
}

void f3<X extends num>(
  void Function((X, String)) v1,
  void Function((int, Object)) v2,
) {
  // DOWN(X, int) = Never, DOWN(String, Object) = String
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never, String))>>();
}

void f4(
  void Function((Function, {Never x})) v1,
  void Function((Never, {int x})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never, {Never x}))>>();
}

void f5(void Function((Object, {Null x})) v1, void Function((Null, {int x})) v2) {
  // DOWN(Object, Null) = Never, DOWN(Null, int) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never, {Never x}))>>();
}

void f6(void Function((ET, {Object x})) v1, void Function((Object, {ET x})) v2) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never, {Never x}))>>();
}

void f7(
  void Function((int, {String s})) v1,
  void Function((String, {int s})) v2,
) {
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never, {Never s}))>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3<int>((x) {}, (x) {});
  print(f4);
  f5((x) {}, (x) {});
  f6((x) {}, (x) {});
  f7((x) {}, (x) {});
}
