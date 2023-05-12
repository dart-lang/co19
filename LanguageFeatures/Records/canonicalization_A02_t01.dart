// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The current specification relies on identical() to decide when to
/// canonicalize constant object creation expressions. Since identical() is not
/// useful for records (see below), we update that:
///
/// Define two Dart values, a and b, to be structurally equivalent as follows:
///
/// If a and b are both records, and they have the same shape, and for each
/// field f of that shape, the records' values of that field, af and bf are
/// structurally equivalent, then a and b are structurally equivalent.
///
/// If a and b are non-record object references, and they refer to the same
/// object, then a and b are structurally equivalent. So structural equivalence
/// agrees with identical() for non-records.
///
/// Otherwise a and b are not structurally equivalent.
///
/// With that definition, the rules for object and collection canonicalization
/// is changed from requiring that instance variable, list/set element and map
/// key/value values are identical() between the instances, to them being
/// structurally equivalent.
///
/// This change allows a class like:
///
/// class C {
///   final (int, int) pair;
///   const C(int x, int y) : pair = (x, y);
/// }
/// to be properly canonicalized for objects with the same effective state,
/// independently of whether identical() returns true or false on the pair value.
///
/// @description Checks canonicalization of the object containing records
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C1 {
  final (int, int) pair;
  const C1(int x, int y) : pair = (x, y);
}

class C2 {
  final (int, {int second}) pair;
  const C2(int x, int y) : pair = (x, second: y);
}

class C3 {
  final ({int first, int second}) pair;
  const C3(int x, int y) : pair = (first: x, second: y);
}

main() {
  const c1a = C1(1, 2);
  const c1b = C1(1, 2);
  Expect.identical(c1a, c1b);

  const c2a = C2(1, 2);
  const c2b = C2(1, 2);
  Expect.identical(c2a, c2b);

  const c3a = C3(1, 2);
  const c3b = C3(1, 2);
  Expect.identical(c3a, c3b);
}
