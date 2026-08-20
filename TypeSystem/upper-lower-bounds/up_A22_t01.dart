// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`Function`, `T Function<...>(...)`) = `Function`
///
/// @description Check that UP(`Function`, `T Function<...>(...)`) = `Function`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(Function t1, int Function() t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, int Function()) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f2(Function t1, void Function(int) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, void Function(int)) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f3(Function t1, num Function(int, String) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, num Function(int, String)) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f4(Function t1, int Function([int]) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, int Function([int])) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f5(Function t1, int Function({int i}) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, int Function({int i})) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f6(Function t1, int Function({required int i}) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(Function, int Function({required int i})) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f7(Function t1, FPositional t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, FPositional) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f8(Function t1, FNamed t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, FNamed) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f9<X extends num>(Function t1, X Function(X) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Function, X Function(X)) = Function
  v.expectStaticType<Exactly<Function>>();
}

void f10(Function t1, void Function<X extends num>(X) t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(Function, void Function<X extends num>(X)) = Function
  v.expectStaticType<Exactly<Function>>();
}

void main() {
  f1(() {}, () => 1);
  f2(() {}, (int i) {});
  f3(() {}, (int i, String s) => i);
  f4(() {}, ([int i = 0]) => i);
  f5(() {}, ({int i = 0}) => i);
  f6(() {}, ({required int i}) => i);
  f7(() {}, fPositional);
  f8(() {}, fNamed);
  f9<int>(() {}, (int x) => x);
  f10(() {}, <X extends num>(X x) {});
}
