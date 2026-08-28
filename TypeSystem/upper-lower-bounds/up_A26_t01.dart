// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T Function<...>(...)`, `T2`) = UP(`Object`, `T2`)
///
/// @description Check that UP(`T Function<...>(...)`, `T2`) = UP(`Object`,`T2`)
/// where `T2` is not a function type and also neither TOP, BOTTOM, NULL,
/// OBJECT nor intersection type.
/// Note that `Function` and a function type are not TOP, OBJECT, NULL, or
/// BOTTOM, and they are not intersection types, or of the form `T?`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1(int Function() t1, num t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int Function(), num) = UP(Object, num) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext(); // Check that `v` is not `FutureOr<Object>`
}

void f2(void Function(int) t1, String t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(void Function(int), String) = UP(Object, String) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f3(FPositional t1, C t2) {
  var v = (1 > 2) ? t1 : t2; // UP(FPositional, C) = UP(Object, C) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f4(FNamed t1, D<int, String> t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(FNamed, D<int, String>) = UP(Object, D<int, String>) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f5(int Function([int]) t1, Record t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(int Function([int]), Record) = UP(Object, Record) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f6(int Function({int i}) t1, Rec t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(int Function({int i}), Rec) = UP(Object, Rec) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f7(void Function<X extends num>(X) t1, E t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(void Function<X extends num>(X), E) = UP(Object, E) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f8(FPositional t1, FutureOr<int> t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(FPositional, FutureOr<int>) = UP(Object, FutureOr<int>) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f9<X extends num>(int Function(X) t1, X t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int Function(X), X) = UP(Object, X) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext();
}

void f10(void Function<X extends num>(X) t1, ET t2) {
  var v = (1 > 2) ? t1 : t2;
  // UP(void Function<X extends num>(X), ET) = UP(Object, ET) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip ?
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void main() {
  f1(() => 1, 1);
  f2((int i) {}, 's');
  f3(<X extends num>(X x, [int i = 0]) => 0, C());
  f4(<X extends num>(X x, {int i = 0}) => 0, D<int, String>());
  f5(([int i = 0]) => i, (1,));
  f6(({int i = 0}) => i, (1, 'two', b: true));
  f7(<X extends num>(X x) {}, E.e0);
  f8(<X extends num>(X x, [int i = 0]) => 0, 1);
  f9<int>((int x) => x, 1);
  f10(<X extends num>(X x) {}, ET(0));
}
