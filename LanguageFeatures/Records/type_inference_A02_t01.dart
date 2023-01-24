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
/// @description Checks horizontal inference for records.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef R1 = (int, {String s});
typedef R2 = (List<int>, {double n});

void f<T, U, V>(void Function(T, U) a, T b, U Function(V) c, V Function(U) d) {
  Expect.equals(R1, T);
  Expect.equals(R2, U);
  Expect.equals(typeOf<void Function(R1, R2)>(), a.runtimeType);
  Expect.equals(typeOf<R2 Function(Object? o)>(), c.runtimeType);
  Expect.equals(typeOf<bool Function(Object? o)>(), d.runtimeType);
}

main() {
  f((t, u) {
    t.$1.isOdd; // T == (int, {String s})
    t.s.substring(0);
    u.$1[0].isOdd; // U == (List<int>, {double n})
    u.n.isNaN;
  }, (42, s: "x"), (v) => (n: 3.14, [1, 2, 3]), (u) => true);
}
