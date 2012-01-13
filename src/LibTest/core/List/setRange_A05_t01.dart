/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Throws an Exception if any required argument is invalid or [:null:].
 * @author varlax
 */


#import("../../../Utils/dynamic_check.dart");

void check(dstSize, srcSize, dstOffset, count) {
  List src = new List(srcSize);
  List dst = new List(dstSize);
  try {
    dst.setRange(dstOffset, count, src, 0);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(Exception ok) {}

  src = new List();
  src.length = srcSize;
  dst = new List();
  dst.length = dstSize;
  try {
    dst.setRange(dstOffset, count, src, 0);
    Expect.fail("expected IndexOutOfRangeException");
  } catch(Exception ok) {}
}

main() {
  checkTypeError( () {
    check(2, 2, 1.3, 2);
  });
  checkTypeError( () {
    check(10, 10, 9, 1.0);
  });

  check(0, 1, null, 1);
  check(41, 42, 0, null);

  checkTypeError( () {
    check(2, 2, true, false);
  });
}
