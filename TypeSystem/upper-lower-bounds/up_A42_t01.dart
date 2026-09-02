// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`C0<T0, ..., Tn>`, `C1<S0, ..., Sk>`) = least upper bound of two
///   interfaces as in Dart 1.
///
/// @description Check that UP(`C0<T0, ..., Tn>`, `C1<S0, ..., Sk>`) = least
/// upper bound of two interfaces. `C0` and `C1` here are not TOP, OBJECT, NULL,
/// BOTTOM, intersection types, types of the form `T?`, type variables, function
/// types, or `Function`, record types, `Future` or `FutureOr` types and not
/// subtypes of each other.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

mixin class A {}
class C1 implements A {}
class C2 implements A {}
class C3 extends A {}
class C4 with A {}

void f1(num t1, String t2) {
  var v = (1 > 2) ? t1 : t2; // UP(num, String) = Object
  v.expectStaticType<Exactly<Object>>();
  v = confirmObjectContext(); // Confirm that `v` is not `FutureOr<Object>`
}

void f2(ET t1, String t2) {
  var v = (1 > 2) ? t1 : t2; // UP(ET, String) = Object?
  v.expectStaticType<Exactly<Object?>>();
  if (v == null) { // Strip ?
    Expect.fail('The actual value must be non-null for the test to complete.');
    return;
  }
  v = confirmObjectContext();
}

void f3(int t1, double t2) {
  var v = (1 > 2) ? t1 : t2; // UP(int, double) = num
  v.expectStaticType<Exactly<num>>();
}

void f4(C1 t1, C2 t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C1, C2) = A
  v.expectStaticType<Exactly<A>>();
}

void f5(C1 t1, C3 t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C1, C3) = A
  v.expectStaticType<Exactly<A>>();
}

void f6(C1 t1, C4 t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C1, C4) = A
  v.expectStaticType<Exactly<A>>();
}

void f7(C3 t1, C4 t2) {
  var v = (1 > 2) ? t1 : t2; // UP(C3, C4) = A
  v.expectStaticType<Exactly<A>>();
}

void main() {
  f1(1, '2');
  f2(ET(0), 's');
  f3(1, 3.14);
  f4(C1(), C2());
  f5(C1(), C3());
  f6(C1(), C4());
  f7(C3(), C4());
}
