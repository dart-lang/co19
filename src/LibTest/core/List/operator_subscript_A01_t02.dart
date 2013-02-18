/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index'th element in the list.
 * @description Checks extendable arrays.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";
main() {
  Expect.isTrue(new List.from([1, 0])[0] == 1);
  var a = [];
  Expect.identical(new List.from([a, 0])[0], a);
  Expect.identical(new List.from([null, 0]).getRange(0,2)[0], null);
  Expect.isTrue(new List.from([1, 2, 3])[0] == 1);
  Expect.isTrue(new List.from([null, null, null])[0] == null);

  Expect.identical(new List.from([1, 2, 3])[2], 3);
  Expect.identical(new List.from([1, null, 3])[1], null);
  Expect.identical(new List.from([1, 2, null])[2], null);
 
  var b = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
  a = new List.from(b.getRange(1, 10));
  for(int i = 1; i <= a.length; ++i) {
    Expect.identical(a[i-1], i);
    Expect.identical(a[a.length-i], a.length+1-i);
  }
}
