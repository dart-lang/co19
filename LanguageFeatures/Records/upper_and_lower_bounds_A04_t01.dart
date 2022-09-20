// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If two record types have the same shape, their least upper bound
/// is a new record type of the same shape where each field's type is the least
/// upper bound of the corresponding field in the original types.
///
/// (num, String) a = (1.2, "s");
/// (int, Object) b = (2, true);
/// var c = cond ? a : b; // c has type `(num, Object)`.
/// Likewise, the greatest lower bound of two record types with the same shape
/// is the greatest lower bound of their component fields:
///
/// a((num, String)) {}
/// b((int, Object)) {}
/// var c = cond ? a : b; // c has type `Function((int, String))`.
/// The least upper bound of two record types with different shapes is [Record].
///
/// (num, String) a = (1.2, "s");
/// (num, String, bool) b = (2, "s", true);
/// var c = cond ? a : b; // c has type `Record`.
/// The greatest lower bound of records with different shapes is [Never].
///
/// @description Check that the greatest lower bound of records with different
/// shapes is Never
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/static_type_helper.dart";

(num, String) a1((num, String) r) => r;
(int, Object, bool) b1((int, Object, bool) r) => r;

(double, {String x}) a2((double, {String x}) r) => r;
(num, {List<int> l}) b2((num, {List<int> l}) r) => r;

({double d, String? x}) a3(({double d, String? x}) r) => r;
({num d, List<int> x, bool b}) b3(({num d, List<int> x, bool b}) r) => r;

() a4(() r) => r;
(int,) b4((int,) r) => r;

main() {
  var c1 = 1 > 2 ? a1 : b1;
  c1.expectStaticType<Exactly<Record Function(Never n)>>();

  var c2 = 1 > 2 ? a2 : b2;
  c2.expectStaticType<Exactly<Record Function(Never n)>>();

  var c3 = 1 > 2 ? a3 : b3;
  c3.expectStaticType<Exactly<Record Function(Never n)>>();

  var c4 = 1 > 2 ? a4 : b4;
  c4.expectStaticType<Exactly<Record Function(Never n)>>();
}
