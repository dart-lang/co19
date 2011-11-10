/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converts [other] to a string and creates a new string by
 *            concatenating this string with the converted [other].
 * @description Checks that this operator works correctly with boolean and
 *              various number types
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  String str = "result: ";
  
  Expect.isTrue(str + 1 == "result: 1");
  Expect.isTrue(str + true == "result: true");
  Expect.isTrue(str + false == "result: false");
  Expect.isTrue(str + 2.5 == "result: 2.5");
  Expect.isTrue(str + 2e2 == "result: 200.0");
}
