// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void sort([int compare(E a, E b)])
/// Sorts the list according to the order specified by the compare function.
/// @description Checks that sorting is correct.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> list, List<double> expected) {
  var actual = new Float64List.fromList(list);
  int c(var a, var b) {
    return a < b ? -1 : (a == b ? 0 : 1);
  }
  actual.sort(c);
  Expect.listEquals(expected, actual);
}

main() {
  check([], []);
  check([1.0], [1.0]);
  check([1.0, 2.0], [1.0, 2.0]);
  check([1.0, 2.0, 4.0, 3.0, 5.0, 6.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
  check([2.0, 1.0, 4.0, 3.0, 6.0, 5.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
  check([6.0, 5.0, 4.0, 3.0, 2.0, 1.0], [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
  check([
    9.0, 9.0, 1.0, 2.0, 3.0, 0.0, 3.0, 2.0, 2.0, 3.0, 4.0, 1.0, 9.0, 5.0, 7.0,
    7.0, 5.0, 6.0, 1.0, 0.0, 4.0, 8.0, 8.0, 8.0, 5.0, 4.0, 6.0, 7.0, 6.0, 0.0
  ], [
    0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0,
    5.0, 5.0, 5.0, 6.0, 6.0, 6.0, 7.0, 7.0, 7.0, 8.0, 8.0, 8.0, 9.0, 9.0, 9.0
  ]);
}
