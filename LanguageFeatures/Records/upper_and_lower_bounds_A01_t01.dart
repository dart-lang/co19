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
/// @description Check that if two record types have the same shape, their least
/// upper bound is a new record type of the same shape where each field's type
/// is the least upper bound of the corresponding field in the original types
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

main() {
  (num, String) a1 = (1.2, "s");
  (int, Object) b1 = (2, true);
  var c1 = 1 > 2 ? a1 : b1;
  c1.expectStaticType<Exactly<(num, Object)>>();

  (double, {String x}) a2 = (3.14, x: "s");
  (int, {List<int> x}) b2 = (42, x: []);
  var c2 = 1 > 2 ? a2 : b2;
  c2.expectStaticType<Exactly<(num, Object)>>();

  ({String s, Null n}) a3 = (n: null, s: "s");
  ({List<int> s, String n}) b3 = (n: "n", s: []);
  var c3 = 1 > 2 ? a3 : b3;
  c3.expectStaticType<Exactly<(Object, String?)>>();
}
