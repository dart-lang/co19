// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The fields in a record expression are evaluated left to right.
///
/// @description Checks that the fields in a record expression are evaluated
/// left to right.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

List<int> log = [];

int test(int i) {
  log.add(i);
  return i;
}

main() {
  var r1 = (test(1), test(2), test(3));
  Expect.listEquals([1, 2, 3], log);
  log.clear();
  var r2 = (test(1), x: test(2), y: test(3));
  Expect.listEquals([1, 2, 3], log);
  log.clear();
  var r3 = (x: test(2), test(1), y: test(3));
  Expect.listEquals([2, 1, 3], log);
  log.clear();
  var r4 = (x: test(1), y: test(2), z: test(3));
  Expect.listEquals([1, 2, 3], log);
  log.clear();
  ({int a, int b, int c}) r5 = (a: test(1), b: test(2), c: test(3));
  Expect.listEquals([1, 2, 3], log);
  log.clear();
  ({int a, int b, int c}) r6 = (b: test(1), c: test(2), a: test(3));
  Expect.listEquals([1, 2, 3], log);
  log.clear();
  (int, int, {int a, int b, int c}) r7 =
      (b: test(1), test(2), c: test(3), a: test(4), test(5));
  Expect.listEquals([1, 2, 3, 4, 5], log);
}
