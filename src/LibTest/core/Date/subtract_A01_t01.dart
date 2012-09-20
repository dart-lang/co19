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
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)) is Date);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).subtract(new Duration(days: -100000, hours: -100000, minutes: -100000, seconds: -100000, milliseconds: -100000)) is Date);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).subtract(new Duration(days: 100000, hours: 100000, minutes: 100000, seconds: 100000, milliseconds: 100000)) is Date);
}
