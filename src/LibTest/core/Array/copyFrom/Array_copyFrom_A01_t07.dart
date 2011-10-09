/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies into this array the elements from [src] in the given range.
 * @description Checks that needed elements are copied.
 * @author iefremov
 * @reviewer msyabro
 * @needsreview
 */


void check(Array src, Array dst, int srcOffset, int dstOffset, int count) {
    dst.copyFrom(src, srcOffset, dstOffset, count);

}

void arrayEquals(Array expected, Array actual) {
  Expect.isTrue(expected.length == actual.length);
  for(var i = 0; i < expected.length; i+=1) {
    Expect.isTrue(expected[i] === actual[i]);
    Expect.isTrue(expected[i] == actual[i]);
  }
}

main() {  
  Array dst = new Array(5);
  Array src = [dst, null];
  src[1] = src;

  dst.copyFrom(src, 0, 0, 2);
  arrayEquals([dst, src, null, null, null], dst);

  dst.copyFrom(src, 1, 4, 1);
  arrayEquals([dst, src, null, null, src], dst);

  dst.copyFrom(src, 0, 2, 2);
  arrayEquals([dst, src, dst, src, src], dst);
}
