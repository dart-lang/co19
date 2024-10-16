// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void notIdentical(
///    var expected, var actual, [String reason = ''])
/// Checks whether the expected and actual values are not identical.
///
/// @description Checks that an `ExpectException` is thrown when the arguments
/// are identical.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class C {
  final value;
  const C(this.value);
}

void check(var arg1, var arg2, [String reason = '']) {
  try {
    Expect.notIdentical(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(_) {
  }
}

main() {
  int one = 1;
  String x = "x";
  check(x, x);
  check(const Object(), const Object());
  check(const C(42), const C(42));
  check(1, one);
}
