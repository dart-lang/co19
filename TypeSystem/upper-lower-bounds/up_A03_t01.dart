// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if TOP(`T1`)
///
/// @description Check that UP(`T1`, `T2`) = `T1` if TOP(`T1`). Test `void`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import 'up_lib.dart';

void f1(num n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v); // Type void cannot be used
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f2(num n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f3<X extends num>(X n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f4<X extends num>(X n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f5() {
  var v = (1 > 2) ? getVoid() : null;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f6() async {
  var v = (1 > 2) ? getFutureOrVoid() : null;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f7(Never n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f8(Never n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f9(Function n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f10(Function n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f11(Record n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f12(Record n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f13(FutureOr<int> n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f14(FutureOr<int> n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f15(String? n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f16(String? n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f17(C n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f18(C n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f19(D<int, String> n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f20(D<int, String> n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f21(FPositional n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f22(FPositional n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f23(FNamed n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f24(FNamed n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f25(Rec n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f26(Rec n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f27(E n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f28(E n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f29(ET n) {
  var v = (1 > 2) ? getVoid() : n;
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

void f30(ET n) async {
  var v = (1 > 2) ? getFutureOrVoid() : n;
  print(await v);
//      ^^^^^^^
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
