// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void stringEquals(
///   String expected, String actual, [String reason = ''])
/// Specialized equality test for strings. 
/// @description Checks that using non-equal string arguments results in
/// [ExpectException] being thrown, regardless of reason (the last argument).
/// @author rodionov

import "../../../Utils/expect.dart";

main() {
  check("", null);
  check("", null, "");
  check("", null, "not empty");

  check(null, "");
  check(null, "", "");
  check(null, "", "not empty");

  check("foo", "fOo");
  check("foo", "fOo", "");
  check("foo", "fOo", "not empty");

  check("1", "1.0");
}

void check(var arg1, var arg2, [String reason = '']) {
  try {
    Expect.stringEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}
