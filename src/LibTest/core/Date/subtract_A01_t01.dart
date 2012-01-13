/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date subtract(Duration other) returns [Date].
 * @description Checks that the method returns Date instance
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).subtract(new Duration(0, 0, 0, 0, 0)) is Date);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).subtract(new Duration(-100000, -100000, -100000, -100000, -100000)) is Date);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).subtract(new Duration(100000, 100000, 100000, 100000, 100000)) is Date);
}
