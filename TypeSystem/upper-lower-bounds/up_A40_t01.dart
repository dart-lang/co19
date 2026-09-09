// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `T2`) = `T1` if `T2` <: `T1`
///   Note that both types must be class types at this point.
///
/// @description Check that UP(`T1`, `T2`) = `T1` if `T2` <: `T1` and both
/// operands are class types.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

class A {}
class B extends A {}

void f1(num t1, int t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, int) = num
  v.expectStaticType<Exactly<num>>();
}

void f2(A t1, B t2) {
  var v = (1 > 2) ? t1 : t2; // UP(A, B) = A
  v.expectStaticType<Exactly<A>>();
}

void f3(ET t1, ET2 t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET, ET2) = ET
  v.expectStaticType<Exactly<ET>>();
}

void f4(Future<num> t1, Future<int> t2) {
  var v = (1 > 2) ? t1 : t2; // UP(Future<num>, Future<int>) = Future<num>
  v.expectStaticType<Exactly<Future<num>>>();
}

void f5(Iterable<num> t1, List<int> t2) {
  // UP(Iterable<num>, List<int>) = Iterable<num>
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Iterable<num>>>();
}

void f6(Enum t1, E t2) {
  // UP(Enum, E) = Enum
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Enum>>();
}

void main() {
  f1(1.0, 1);
  f2(A(), B());
  f3(ET(0), ET2(ET(0)));
  f4(Future.value(1.0), Future.value(1));
  f5(<num>[], <int>[]);
  f6(E.e0, E.e0);
}
