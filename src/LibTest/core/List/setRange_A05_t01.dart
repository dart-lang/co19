/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Throws an Exception if any required argument is invalid or [:null:].
 * @static-warning
 * @author varlax
 * @reviewer iefremov
 */


import "../../../Utils/dynamic_check.dart";

void check(dstSize, srcSize, dstOffset, count) {
  List src = new List(srcSize);
  List dst = new List(dstSize);
  Expect.throws(() => dst.setRange(dstOffset, count, src, 0));

  src = new List();
  src.length = srcSize;
  dst = new List();
  dst.length = dstSize;
  Expect.throws(() => dst.setRange(dstOffset, count, src, 0));
}

main() {
  check(2, 2, 1.3, 2);
  check(10, 10, 9, 1.0);

  check(0, 1, null, 1);
  check(41, 42, 0, null);

  check(2, 2, true, false);


  Expect.throws(() => new List.from([]).setRange(2, true, false)); /// static type warning  /// static type warning
  Expect.throws(() => new List.from([]).setRange(2, true, null)); /// static type warning  /// static type warning
  Expect.throws(() => new List.from([]).setRange(2, null, null)); /// static type warning  /// static type warning

  Expect.throws(() => [].setRange(2, true, false)); /// static type warning  /// static type warning
  Expect.throws(() => [].setRange(2, true, null)); /// static type warning  /// static type warning
  Expect.throws(() => [].setRange(2, null, null)); /// static type warning  /// static type warning
}
