// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if TOP(`T1`)
///
/// @description Check that UP(`T1`, `T2`) = `T1` if TOP(`T1`) and
/// TOP(`T2`) == `false` (which implies `T1 != T2`). Test types `Object?` and
/// `FutureOr<Object?>`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// TODO(sgrekhov): we should distinguish between `dynamic, `Object?` and `FutureOr<Object?>`

void f1a(Object? o, num n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f1b(FutureOr<Object?> o, num n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2a<X extends num>(Object? o, X n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2b<X extends num>(FutureOr<Object?> o, X n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3a(Object? o) {
  var v = (1 > 2) ? o : null;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3b(FutureOr<Object?> o) async {
  var v = (1 > 2) ? o : null;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4a(Object? o, Never n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4b(FutureOr<Object?> o, Never n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5a(Object? o, Function n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5b(FutureOr<Object?> o, Function n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f6a(Object? o, Record n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f6b(FutureOr<Object?> o, Record n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f7a(Object? o, FutureOr<int> n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f7b(FutureOr<Object?> o, FutureOr<int> n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f8a(Object? o, String? n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f8b(FutureOr<Object?> o, String? n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f9a(Object? o, C n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f9b(FutureOr<Object?> o, C n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f10a(Object? o, D<int, String> n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f10b(FutureOr<Object?> o, D<int, String> n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f11a(Object? o, FPositional n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f11b(FutureOr<Object?> o, FPositional n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f12a(Object? o, FNamed n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f12b(FutureOr<Object?> o, FNamed n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f13a(Object? o, Rec n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f13b(FutureOr<Object?> o, Rec n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f14a(Object? o, E n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f14b(FutureOr<Object?> o, E n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f15a(Object? o, ET n) {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f15b(FutureOr<Object?> o, ET n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f16a(Object? o, Future<dynamic> n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<Object?>>();
  v?.checkNotDynamic;
//   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f16b(FutureOr<Object?> o, Future<dynamic> n) async {
  var v = (1 > 2) ? o : n;
  v.expectStaticType<Exactly<FutureOr<Object?>>>();
  (await v)?.checkNotDynamic;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  print(f1a);
  print(f1b);
  print(f2a);
  print(f2b);
  print(f3a);
  print(f3b);
  print(f4a);
  print(f4b);
  print(f5a);
  print(f5b);
  print(f6a);
  print(f6b);
  print(f7a);
  print(f7b);
  print(f8a);
  print(f8b);
  print(f9a);
  print(f9b);
  print(f10a);
  print(f10b);
  print(f11a);
  print(f11b);
  print(f12a);
  print(f12b);
  print(f13a);
  print(f13b);
  print(f14a);
  print(f14b);
  print(f15a);
  print(f15b);
  print(f16a);
  print(f16b);
}
