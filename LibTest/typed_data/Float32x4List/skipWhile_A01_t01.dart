/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * Returns an [Iterable] that skips elements while [test] is satisfied.
 * @description Checks that all first elements that satisfy test are skipped,
 * and elements after that are retained.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void check(List<Float32x4> list, bool test(Float32x4 element)) {
  var l = new Float32x4List.fromList(list);
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
    Expect.isTrue(equal(it0.current, it.current));
    hasNext0 = it0.moveNext();
  }
  Expect.equals(l.length - skipCount, len);
}

main() {
  List<Float32x4> a0 =
    [pack(1.0), pack(3.0), pack(7.0), pack(4.0), pack(5.0), pack(6.0)];
  check(a0, (var element) => element.x == 1.0);
  check(a0, (var element) => true);
  check(a0, (var element) => false);
  check(a0, (var element) => element.x > 4.0);
  check(a0, (var element) => element.x < 4.0);
  check(a0, (var element) => element.x == 4.0);
}
