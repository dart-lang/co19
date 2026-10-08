// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2`) = `T1` if `T1` <: `T2`
///
/// @description Check that DOWN(`T1`, `T2`) = `T1` if `T1` <: `T2`. Test class
/// types, for which no earlier rule applies: they are not TOP, BOTTOM, NULL,
/// OBJECT, of the form `T?`, function types, or record types.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

class A {}
class B extends A {}

void f1(void Function(int) v1, void Function(num) v2) {
  // DOWN(int, num) = int
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int)>>();
}

void f2(void Function(B) v1, void Function(A) v2) {
  // DOWN(B, A) = B
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(B)>>();
}

void f3(void Function(ET2) v1, void Function(ET) v2) {
  // DOWN(ET2, ET) = ET2
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(ET2)>>();
}

void f4(void Function(Future<int>) v1, void Function(Future<num>) v2) {
  // DOWN(Future<int>, Future<num>) = Future<int>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

void f5(void Function(List<int>) v1, void Function(Iterable<num>) v2) {
  // DOWN(List<int>, Iterable<num>) = List<int>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(List<int>)>>();
}

void main() {
  f1((x) {}, (x) {});
  f2((x) {}, (x) {});
  f3((x) {}, (x) {});
  f4((x) {}, (x) {});
  f5((x) {}, (x) {});
}
