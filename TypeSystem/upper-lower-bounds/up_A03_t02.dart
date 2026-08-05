// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if TOP(`T1`)
///
/// @description Check that UP(`T1`, `T2`) = `T1` if TOP(`T1`) and
/// TOP(`T2`) == `false`. Test `void`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(Object? o, num n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2(FutureOr<Object?> o, num n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3<X extends num>(Object? o, X n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4<X extends num>(FutureOr<Object?> o, X n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5(Object? o) {
  var v = (1 > 2) ? o : null;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f6(FutureOr<Object?> o) async {
  var v = (1 > 2) ? o : null;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f7(Object? o, Never n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f8(FutureOr<Object?> o, Never n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f9(Object? o, Function n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f10(FutureOr<Object?> o, Function n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f11(Object? o, Record n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f12(FutureOr<Object?> o, Record n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f13(Object? o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f14(FutureOr<Object?> o, FutureOr<int> n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f15(Object? o, String? n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f16(FutureOr<Object?> o, String? n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f17(Object? o, C n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f18(FutureOr<Object?> o, C n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f19(Object? o, D<int, String> n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f20(FutureOr<Object?> o, D<int, String> n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f21(Object? o, FPositional n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f22(FutureOr<Object?> o, FPositional n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f23(Object? o, FNamed n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f24(FutureOr<Object?> o, FNamed n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f25(Object? o, Rec n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f26(FutureOr<Object?> o, Rec n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f27(Object? o, E n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f28(FutureOr<Object?> o, E n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f29(Object? o, ET n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f30(FutureOr<Object?> o, ET n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
  print(f7);
  print(f8);
  print(f9);
  print(f10);
  print(f11);
  print(f12);
  print(f13);
  print(f14);
  print(f15);
  print(f16);
  print(f17);
  print(f18);
  print(f19);
  print(f20);
  print(f21);
  print(f22);
  print(f23);
  print(f24);
  print(f25);
  print(f26);
  print(f27);
  print(f28);
  print(f29);
  print(f30);
}
