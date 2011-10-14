/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sign of the modulo (%) is always positive.
 * @description Check that result of % is always positive 
 * @author akuznecov
 * @reviewer msyabro
 */


main() {
  // Example 102
  Expect.isTrue((17 % 3) == 2);
  Expect.isTrue((17 % -3) == 2);
  Expect.isTrue((-17 % 3) == 1);
  Expect.isTrue((-17 % -3) == 1);
}
