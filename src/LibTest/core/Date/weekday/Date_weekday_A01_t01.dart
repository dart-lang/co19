/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get weekday()
 * Returns the week day [MON..SUN]. If the date is invalid throws an exception.
 * @description Checks property value when date is valid.
 * @author akuznecov
 * @reviewer pagolubev
 */


main() {
  Date date = new Date(1991, 8, 18);
  Expect.isTrue(date.weekday == Date.SUN);
}
