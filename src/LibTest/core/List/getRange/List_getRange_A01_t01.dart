/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a sub list copy of this list, from [start] to
 * [:start + length:].
 * @description Checks fixed size lists with valid ranges.
 * @author vasya
 * @reviewer varlax
 */

void check(List src, int start, int length) {
  var dst = src.getRange(start, length);
  for(int i = 0; i < dst.length; i++) {
    Expect.equals(src[i+start], dst[i]);
    Expect.identical(src[i+start], dst[i]);
  }
}

main() {
  List l = new List(100);
  for (var i = 0; i < l.length; i++){
    l[i] = i;
  }
  check(l, 0, 100);
  check(l, 0, 1);
  check(l, 99, 1);
  check(l, 90, 9);
}
