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
/// @description Checks an implicit downcast for records
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

class Callable {
  void call(num x) {}
}

T id<T>(T x) => x;

main() {
  var c = Callable();
  dynamic d = 3;
  (num, double, int Function(int), void Function(num)) r1 = (d, 3, id, c)
    ..expectStaticType<
        Exactly<(num, double, int Function(int), void Function(num))>>();

  Expect.throws(() {
    dynamic d2 = 3.14;
    (int, double, int Function(int), void Function(num)) r2 = (d2, 3, id, c);
  });
  if (!isJS) {
    Expect.throws(() {
      (r1.$2 as dynamic).isEven;
    });
  }
  Expect.throws(() {
    (r1.$3 as dynamic)("42");
  });
  Expect.throws(() {
    (r1.$4 as dynamic)("42");
  });
}
