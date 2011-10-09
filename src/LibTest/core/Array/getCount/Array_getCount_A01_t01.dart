/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the number of elements in the array.
 * @description Checks that the method returns correct number of elements in the array.
 * @author vasya
 * @reviewer iefremov
 */


main() {
  Expect.isTrue([].getCount() == 0);
  Expect.isTrue([null].getCount() == 1);
  Expect.isTrue([1,2,3].getCount() == 3);
  Expect.isTrue([ [], [null], [1,2,3], [null,"",1] ].getCount() == 4);

  Array a = new Array(99999999);
  Expect.isTrue(a.getCount() == 99999999);
}
