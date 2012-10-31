/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an [ArgumentError] if [length] is negative.
 * @description Checks that ArgumentError is thrown if length is negative.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */


void check(int dstSize, int srcSize, int length) {
  List dst = new List(dstSize);
  List src = new List(srcSize);
  try {
    dst.setRange(0, length, src);
    Expect.fail("ArgumentError expected");
  } on ArgumentError catch(ok) {}

  dst = new List();
  dst.length = dstSize;
  src = new List();
  src.length = srcSize;
  try {
    dst.setRange(0, length, src);
    Expect.fail("ArgumentError expected");
  } on ArgumentError catch(ok) {}
}

main() {
  check(2, 1, -1);
  check(44, 42, -2);
  check(6031769, 100500, -6031769);

  Expect.throws(() => [].setRange(0, -1, []));
  Expect.throws(() => new List.from([]).setRange(0, -1, []));
}
