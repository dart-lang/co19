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
/// @description Checks that if records are structurally equivalent then
/// `identical()` can be computed (but the returned value is not known).
/// @author sgrekhov22@gmail.com

main() {
  var r1 = ("a", 1, const [42], const {"x": 0}, const {1, 2, 3});
  var r2 = const ("a", 1, [42], {"x": 0}, {1, 2, 3},);
  var r3 = const ("a", 1, [42], {"x": 0}, {1, 2, 3},);
  identical(r1, r2);
  identical(r2, r3);

  var r4 =
    (s: "a", n: 1, l: const [42], m: const {"x": 0}, set: const {1, 2, 3});
  var r5 = const (set: {1, 2, 3}, n: 1, l: [42], s: "a", m: {"x": 0}, );
  var r6 = const (set: {1, 2, 3}, n: 1, l: [42], s: "a", m: {"x": 0});
  identical(r4, r5);
  identical(r5, r6);

  var r7 = ("a", 1, const [42], m: const {"x": 0}, s: const {1, 2, 3},
      n: 3.14, st: "Hi");
  var r8 = const (m: {"x": 0}, "a", s: {1, 2, 3}, n: 3.14, st: "Hi", 1, [42]);
  var r9 = const (m: {"x": 0}, "a", s: {1, 2, 3}, n: 3.14, st: "Hi", 1, [42]);
  identical(r7, r8);
  identical(r8, r9);
}
