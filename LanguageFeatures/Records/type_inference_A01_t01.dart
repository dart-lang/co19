// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type schema K and a record expression E of the general
/// form (e1, ..., en, d1 : e{n+1}, ..., dm : e{n+m}) inference proceeds as
/// follows.
///
/// If K is a record type schema of the form
/// (K1, ..., Kn, {d1 : K{n+1}, ...., dm : K{n+m}}) then:
///
/// - Each ei is inferred with context type schema Ki to have type Si
///   - Let Ri be the greatest closure of Ki
///   - If Si is a subtype of Ri then let Ti be Si
///   - Otherwise, if Si is dynamic, then we insert an implicit cast on ei to
///     Ri, and let Ti be Ri
///   - Otherwise, if Si is coercible to Ri (via some sequence of call method
///     tearoff or implicit generic instantiation coercions), then we insert the
///     appropriate implicit coercion(s) on ei. Let Ti be the type of the
///     resulting coerced value (which must be a subtype of Ri, possibly proper).
///   - Otherwise, it is a static error.
///  - The type of E is (T1, ..., Tn, {d1 : T{n+1}, ...., dm : T{n+m}})
/// If K is any other type schema:
///
/// - Each ei is inferred with context type schema _ to have type Ti
/// - The type of E is (T1, ..., Tn, {d1 : T{n+1}, ...., dm : T{n+m}})
///
/// @description Checks type inference for records.
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

main() {
  var r1 = (42, "");
  r1.expectStaticType<Exactly<(int, String)>>();

  final r2 = (null, 3.14);
  r2.expectStaticType<Exactly<(Null, double)>>();

  var r3 = (42, s: "");
  r3.expectStaticType<Exactly<(int, {String s})>>();

  final r4 = (null, d: 3.14);
  r4.expectStaticType<Exactly<(Null, {double d})>>();

  var r5 = (i: 42, s: "");
  r5.expectStaticType<Exactly<({int i, String s})>>();

  final r6 = (n: null, d: 3.14);
  r6.expectStaticType<Exactly<({Null n, double d})>>();
}
