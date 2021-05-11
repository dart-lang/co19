// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The requirement that the condition in a boolean conditional
/// control expression (e.g. the a conditional statement, conditional element,
/// while loop, etc) be assignable to bool is unchanged from pre null-safe Dart.
///
/// @description Checks that the static type of the condition must be assignable
/// to bool
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

Never foo() {
  throw "Never";
}

dynamic bar(x) => x;

main() {
  bool b = true;
  if (b) {}
  if (bar(true)) {}
  Expect.throws(() {
    if (bar("Lily was here"));
  });
  Expect.throws(() {
    if (foo()) {}
  });
  Null n = null;
}
