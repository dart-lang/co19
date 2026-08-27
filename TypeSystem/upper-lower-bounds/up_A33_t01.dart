// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T1`, `(...)`) = UP(`T1`, `Object`)
///
/// @description Check that UP(`T1`, `(...)`) = UP(`T1`, `Object`) = `Object`
/// if `T1` is not `T?` and is neither a record type, TOP, BOTTOM, NULL, OBJECT,
/// function type nor an intersection type.
/// Note that no earlier rule applies because record types are never TOP, OBJECT,
/// NULL, BOTTOM, intersection types, types of the form `T?`, type variables,
/// function types, or `Function`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(num t1, () t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, ()) = UP(num, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f2(String t1, (int,) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(String, (int,)) = UP(String, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f3(C t1, (dynamic, String) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C, (dynamic, String)) = UP(C, Object) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f4(D<int, String> t1, (void, {String s}) t2) {
  // UP(D<int, String>, (void, {String s})) = UP(D<int, String>, Object) = Object
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f5(E t1, ({Object? i, String s}) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(E, ({Object? i, String s})) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f6(FutureOr<int> t1, Rec t2) {
  // UP(FutureOr<int>, Rec) = UP(FutureOr<int>, Object) = Object
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f7(int t1, (E,) t2) {
  // UP(int, (E,)) = UP(int, Object) = Object
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f8(bool t1, (FutureOr<int>,) t2) {
  // UP(bool, (FutureOr<int>,)) = UP(bool, Object) = Object
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f9(C t1, (Function,) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C, (Function,)) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f10(num t1, (ET,) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, (ET,)) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f11(String t1, (Never,) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(String, (Never,)) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f12(ET t1, (int,) t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET, (int,)) = UP(ET, Object) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip ?
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void main() {
  f1(1, ());
  f2('s', (1,));
  f3(C(), (1, 'two'));
  f4(D<int, String>(), (1, s: 'two'));
  f5(E.e0, (i: 1, s: 'two'));
  f6(1, (1, 'two', b: true));
  f7(1, (E.e0,));
  f8(true, (1,));
  f9(C(), (() {},));
  f10(1, (ET(0),));
  print(f11);
  f12(ET(0), (1,));
}
