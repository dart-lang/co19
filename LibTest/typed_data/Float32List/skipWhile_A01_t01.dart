// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Iterable<E> skipWhile(bool test(E value))
/// Returns an [Iterable] that skips leading elements while [test] is satisfied.
/// @description Checks that all first elements that satisfy test are skipped,
/// and elements after that are retained.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<double> list, bool test(double element)) {
  var l = new Float32List.fromList(list);
  var it0 = l.iterator;
  var res = l.skipWhile(test);
  var it = res.iterator;
  var skipCount = 0;

// skip manually
  var hasNext0;
  while ((hasNext0 = it0.moveNext()) && test(it0.current)) {
    skipCount++;
  }

// check that the rest of a0 is identical to a
  var len = 0;
  for (;;) {
    var hasNext = it.moveNext();
    Expect.equals(hasNext0, hasNext);
    if (!hasNext0) break;
    len++;
    Expect.equals(it0.current, it.current);
    hasNext0 = it0.moveNext();
  }
  Expect.equals(l.length - skipCount, len);
}

main() {
  var a0 = [1.0, 3.0, 7.0, 4.0, 5.0, 6.0];
  check(a0, (var element) => element == 1.0);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element > 4.0);
  check(a0, (var element) => element < 4.0);
  check(a0, (var element) => element == 4.0);
}
