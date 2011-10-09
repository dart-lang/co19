/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if there is no element in the array.
 * @description Trivial check.
 * @author vasya
 * @reviewer iefremov
 */


main() {
  Expect.isTrue([].isEmpty() == true);
  Expect.isTrue([null].isEmpty() == false);
  Expect.isTrue([0,1,2,3,4].isEmpty() == false);
  Expect.isTrue([[]].isEmpty() == false);

  Array a = new Array(0);
  Expect.isTrue(a.isEmpty() == true);
  a = new Array(46985698);
  Expect.isTrue(a.isEmpty() == false);
}
