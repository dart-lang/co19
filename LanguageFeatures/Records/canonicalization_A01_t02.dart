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
/// @description Checks that `identical()` is false for records if they are not
/// structurally equivalent
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

main() {
  if (!isJS) {
    var r1 = ("a", 1, [42], {"x": 0}, {1, 2, 3});
    var r2 = ("a", 1.0, [42], {"x": 0}, {1, 2, 3},);
    Expect.isFalse(identical(r1, r2));
  }

  var r3 = (s: "a", n: 1, l: [42], m: {"x": 0}, set: {1, 2, 3});
  var r4 = (notS: "a", n: 1, l: [42], m: {"x": 0}, set: {1, 2, 3});
  Expect.isFalse(identical(r3, r4));

  var r5 = ("a", 1, l: [42], m: {"x": 0}, set: {1, 2, 3});
  var r6 = (1, l: [42], m: {"x": 0}, set: {1, 2, 3});
  Expect.isFalse(identical(r5, r6));

  var r7 = ("a", 1, l: [42], m: {"x": 0}, set: {1, 2, 3});
  var r8 = ("a", 1, l: [42], m: {"x": 0}, set: {1, 2, 3, 4});
  Expect.isFalse(identical(r7, r8));

  var r9 = ("a", 1, l: [42], m: {"x": 0}, set: {1, 2, 3});
  var r10 = ("a", 1, l: [42], m: {"x": 1}, set: {1, 2, 3});
  Expect.isFalse(identical(r9, r10));
}
