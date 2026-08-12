// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `X2 & B2`) =
///   - `X2` if `T1 <: X2`
///   - otherwise `T1` if `X2 <: T1`
///   - otherwise UP(`T1`, `B2a`) where `B2a` is the greatest closure of `B2`
///     with respect to `X2`, as defined in inference.md.
///
/// @description Check that UP(`T1`, `X2 & B2`) = `T1` if `T1 != X2 & B2`,
/// TOP(`T1`) `== false`, BOTTOM(`T1`) `== false` and `X2 <: T1`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

// ignore_for_file: dead_code

class A {}
class B2 extends A {}

void f1<T1, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}


void f2<T1 extends A, X2 extends T1>(T1 t1, X2 x2) {
  if (x2 is B2) { // `x2` promoted to `X2 & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(T1, X2 & B2) = T1 because X2 <: T1
    v.expectStaticType<Exactly<T1>>();
  }
}

void f3(num t1, int x2) {
  if (x2 is B2) { // `x2` promoted to `int & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(num, int & B2) = num because int <: num
    v.expectStaticType<Exactly<num>>();
  }
}

void f4(Null t1, String? x2) {
  if (x2 is B2) { // `x2` promoted to `String? & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(Null, String? & B2) = String? because String? <: Null
    v.expectStaticType<Exactly<String?>>();
  }
}

void f5(Function t1, FPositional x2) {
  if (x2 is B2) { // `x2` promoted to `FPositional & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(Function, FPositional & B2) = Function because FPositional <: Function
    v.expectStaticType<Exactly<Function>>();
  }
}

void f6(Record t1, (int,) x2) {
  if (x2 is B2) { // `x2` promoted to `(int,) & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(Record, (int,) & B2) = Record because (int,) <: Record
    v.expectStaticType<Exactly<Record>>();
  }
}

void f7(FutureOr<num> t1, FutureOr<int> x2) {
  if (x2 is B2) { // `x2` promoted to `FutureOr<int> & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FutureOr<num>, FutureOr<int> & B2) = FutureOr<num> because FutureOr<int> <: FutureOr<num>
    v.expectStaticType<Exactly<FutureOr<num>>>();
  }
}

void f8(num? t1, int? x2) {
  if (x2 is B2) { // `x2` promoted to `int? & B2`.
    var v = (1 > 2) ? t1 : x2; // UP(num?, int? & B2) = num? because int? <: num?
    v.expectStaticType<Exactly<num?>>();
  }
}

void f9(D<num, Object> t1, D<int, String> x2) {
  if (x2 is B2) { // `x2` promoted to `D<int, String> & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(D<num, Object>, D<int, String> & B2) = FutureOr<num> because D<int, String> <: D<num, Object>
    v.expectStaticType<Exactly<D<num, Object>>>();
  }
}

void f10(FPositional t1, FPositional2 x2) {
  if (x2 is B2) { // `x2` promoted to `FPositional2 & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FPositional, FPositional2 & B2) = FPositional because FPositional2 <: FPositional
    v.expectStaticType<Exactly<FPositional>>();
  }
}

void f11(FNamed t1, FNamed2 x2) {
  if (x2 is B2) { // `x2` promoted to `FNamed2 & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(FNamed, FNamed2 & B2) = FNamed because FNamed2 <: FNamed
    v.expectStaticType<Exactly<FNamed>>();
  }
}

void f12(Rec t1, Rec2 x2) {
  if (x2 is B2) { // `x2` promoted to `Rec2 & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(Rec, Rec2 & B2) = Rec because Rec2 <: Rec
    v.expectStaticType<Exactly<Rec>>();
  }
}

void f13(Enum t1, E x2) {
  if (x2 is B2) { // `x2` promoted to `E & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(Enum, E & B2) = Rec because E <: Enum
    v.expectStaticType<Exactly<Enum>>();
  }
}

void f14(ET t1, ET2 x2) {
  if (x2 is B2) { // `x2` promoted to `ET2 & B2`.
    var v = (1 > 2) ? t1 : x2;
    // UP(ET, ET2 & B2) = ET because ET2 <: ET
    v.expectStaticType<Exactly<ET>>();
  }
}

void main() {
  f1<num, int>(1, 2);
  f2<A, B2>(A(), B2());
  f3(1, 2);
  f4(null, 't1');
  f5(() {}, fPositional);
  f6((x: 2), (1,));
  f7(1, Future.value(2));
  f8(1, null);
  f9(D<num, Object>(), D<int, String>());
  f10(fPositional, fPositional2);
  f11(fNamed, fNamed2);
  f12((1 as num, 's' as Pattern, b: true), (1, 's', b: false));
  f13(E2.e0, E.e0);
  f14(ET(2), ET2(ET(1)));
}
