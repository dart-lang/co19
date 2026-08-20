// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the upper bound of two types `T1` and `T2` to be
/// UP(`T1`,`T2`) as follows.
/// ...
/// - UP(`T Function<...>(...)`, `S Function<...>(...)`) = `Function` otherwise
///
/// @description Check that UP(`T Function<...>(...)`, `S Function<...>(...)`) =
/// `Function` if the conditions of the previous function-type cases are not
/// met (i.e. they have different bounds for type parameters, different number
/// of required parameters, different names of named parameters etc.).
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void f1() {
  // Different type parameter bounds.
  var t1 = <X extends num>(X x) => x;
  var t2 = <X extends int>(X x) => x;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void f2() {
  // Different number of required positional parameters.
  var t1 = <X extends num>(X x) => x;
  var t2 = <X extends num>(X x, num y) => x;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void f3() {
  // Different number of type parameters.
  var t1 = <X extends num>(X x) => x;
  var t2 = <X extends num, Y extends num>(X x) => x;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void f4() {
  // Required named parameter of one type is missing in the other.
  var t1 = <X extends num>(X x, {required int a}) => a;
  var t2 = <X extends num>(X x, {required int b}) => b;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void f5() {
  // One function type has named parameters, the other has only positional.
  var t1 = <X extends num>(X x, {int a = 0}) => a;
  var t2 = <X extends num>(X x, int a) => a;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void f6() {
  // Different number of required positional parameters with named parameters.
  var t1 = <X extends num>(X x, {required int a}) => a;
  var t2 = <X extends num>(X x, num y, {required int a}) => a;
  var v = (1 > 2) ? t1 : t2;
  v.expectStaticType<Exactly<Function>>();
}

void main() {
  f1();
  f2();
  f3();
  f4();
  f5();
  f6();
}
