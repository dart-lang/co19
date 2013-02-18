/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [start] is the length of the array, this method inserts the
 * range at the end of the array.
 * @description Checks that array is appended if start equals to array length.
 * @author varlax
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

void check(List src, int length, [val]) {
  int len = src.length;
  List copy = new List.from(src);
  src.insertRange(len, length, val);
  Expect.equals(len + length, src.length);
  for(var i = 0;i<copy.length;i++) {
    Expect.equals(copy[i],src[i],"previous contents spoiled");
  } 
  for(var i = len;i<src.length;i++) {
    Expect.equals(val, src[i]);
  } 

}

main() {
  List l = new List();
  check(l, 10, 1);

  l = [1,2,3,4,5];
  check(l, 50, 10);

  check(l, 20000);

  l = new List.from([1,2,3,4,5]);
  check(l, 50, 10);
  check(l, 20000);
}
