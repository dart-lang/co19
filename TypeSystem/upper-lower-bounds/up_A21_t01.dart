// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T Function<...>(...)`, `Function`) = `Function`
///
/// @description Check that UP(`T Function<...>(...)`, `Function`) = `Function`.
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, or
/// BOTTOM, and they are not intersection types, or of the form `T?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(int Function() t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int Function(), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f2(void Function(int) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(void Function(int), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f3(num Function(int, String) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num Function(int, String), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f4(int Function([int]) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int Function([int]), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f5(int Function({int i}) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int Function({int i}), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f6(int Function({required int i}) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(int Function({required int i}), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f7(FPositional t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FPositional, Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f8(FNamed t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FNamed, Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f9<X extends num>(X Function(X) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2; // UP(X Function(X), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f10(void Function<X extends num>(X) t1, Function t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(void Function<X extends num>(X), Function) = Function
  v.expectStaticType<Exactly<Function>>();
}

void main() {
  f1(() => 1, () {});
  f2((int i) {}, () {});
  f3((int i, String s) => i, () {});
  f4(([int i = 0]) => i, () {});
  f5(({int i = 0}) => i, () {});
  f6(({required int i}) => i, () {});
  f7(fPositional, () {});
  f8(fNamed, () {});
  f9<int>((int x) => x, () {});
  f10(<X extends num>(X x) {}, () {});
}
