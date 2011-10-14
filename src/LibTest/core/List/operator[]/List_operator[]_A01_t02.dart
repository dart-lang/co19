/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index'th element in the list.
 * @description Checks retrieving by arbitrary index.
 * @author iefremov
 * @reviewer msyabro
 */



main() {
  Expect.isTrue([1, 2, 3][0] === 1);
  Expect.isTrue([1, null, 3][1] === null);
  Expect.isTrue([1, 2, null][2] === null);
  
  var a = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
  for(int i = 0; i < a.length; ++i) {
    Expect.isTrue(a[i] === i);
    Expect.isTrue(a[a.length-1-i] === a.length-1-i);
  }
}
