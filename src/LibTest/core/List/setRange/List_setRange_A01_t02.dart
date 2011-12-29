/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies [length] elements of the [from] array, starting
 * from [startFrom], into [:this:], starting at [start].
 * The length of this array does not change, previous entries 
 * in the range are replaced by the new contents.
 * @description Checks that all needed elements are copied.
 * @author iefremov
 * @reviewer msyabro
 * * @reviewer varlax
 */


void check(List src, List dst, int srcOffset, int dstOffset, int count) {
    dst.copyFrom(src, srcOffset, dstOffset, count);

}

void arrayEquals(List expected, List actual) {
  Expect.isTrue(expected.length == actual.length);
  for(var i = 0; i < expected.length; i+=1) {
    Expect.isTrue(expected[i] === actual[i]);
    Expect.isTrue(expected[i] == actual[i]);
  }
}

main() {  
  List dst = new List(5);
  List src = [dst, null];
  src[1] = src;

  dst.setRange(0, 2, src);
  arrayEquals([dst, src, null, null, null], dst);

  dst.setRange(4, 1, src);
  arrayEquals([dst, src, null, null, dst], dst);

  dst.setRange(2, 2, src);
  arrayEquals([dst, src, dst, src, dst], dst);
}
