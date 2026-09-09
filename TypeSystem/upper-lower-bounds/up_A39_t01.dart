// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T2` if `T1` <: `T2`
///   Note that both types must be class types at this point.
///
/// @description Check that UP(`T1`, `T2`) = `T2` if `T1` <: `T2` and both
/// operands are class types.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

class A {}
class B extends A {}

void f1(int t1, num t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int, num) = num
  v.expectStaticType<Exactly<num>>();
}

void f2(B t1, A t2) {
  var v = (1 > 2) ? t1 : t2; // UP(B, A) = A
  v.expectStaticType<Exactly<A>>();
}

void f3(ET2 t1, ET t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET2, ET) = ET
  v.expectStaticType<Exactly<ET>>();
}

void f4(Future<int> t1, Future<num> t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Future<int>, Future<num>) = Future<num>
  v.expectStaticType<Exactly<Future<num>>>();
}

void f5(List<int> t1, Iterable<num> t2) {
  // UP(List<int>, Iterable<num>) = Iterable<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Iterable<num>>>();
}

void f6(E t1, Enum t2) {
  // UP(E, Enum) = Enum
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Enum>>();
}

void main() {
  f1(1, 1.0);
  f2(B(), A());
  f3(ET2(ET(0)), ET(0));
  f4(Future.value(1), Future.value(1.0));
  f5(<int>[], <num>[]);
  f6(E.e0, E.e0);
}
