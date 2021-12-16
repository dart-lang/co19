// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void equals(var expected, var actual, [String reason = ''])
/// Checks whether the expected and actual values are equal (using [:==:]).
///
/// @description Checks that using non-equal arguments results in
/// [ExpectException] being thrown. Arguments being tested include null,
/// boolean, numeric and [Object], along with empty and non-empty reason
/// arguments.
///
/// @author rodionov

import "../../../Utils/expect.dart";

main() {
  check(0, null);
  check(0, null, "");
  check(0, null, "not empty");

  check(null, 0);
  check(null, 0, "");
  check(null, 0, "not empty");

  check(false, new Object());
  check(new Object(), true, "");
  check(1, true, "not empty");

  check(null, false);
}

void check(var arg1, var arg2, [String reason = '']) {
  try {
    Expect.equals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
