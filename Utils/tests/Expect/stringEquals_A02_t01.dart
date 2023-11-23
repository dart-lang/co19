// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void stringEquals(
///   String expected, String actual, [String reason = ''])
/// When the strings don't match,
/// this method shows where the mismatch starts and ends. 
/// @description Checks that message of thrown ExpectException includes 
/// representation of the mismatched region, as well as the reason.
/// @author varlax

import "../../../Utils/expect.dart";

main() {
  check("foo bar", "fOo Bar", "oo b", "Oo B" );
  check("foo", "fOo1", "o", "Oo1", "ASD SD");
  check("foo", "fooOo", "", "Oo", "not empty");
  check("111 buzz", "buzz", "111");

  check("", null, "null");
  check(null, "", "null");
  check("", null, "null", null, "not empty");
}

void check(var exp, var act, var arg1, [var arg2 = null, String reason = '']) {
  try {
    Expect.stringEquals(exp, act, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    String msg = e.message as String;
    if (!msg.contains(exp.toString(), 0)) throw "no expected value";
    if (!msg.contains(act.toString(), 0)) throw "no actual value";
    if (arg1 != null && !msg.contains(arg1, 0)) throw "no correct diff";
    if (arg2 != null && !msg.contains(arg2, 0)) throw "no correct diff";
    if (!reason.isEmpty && !msg.contains(reason, 0)) throw "no reason";
  }
}
