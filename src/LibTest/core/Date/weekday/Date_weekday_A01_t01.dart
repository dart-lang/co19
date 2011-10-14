/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get weekday()
 * Returns the week day [MON..SUN].
 * @description Checks property value when date is valid.
 * @author akuznecov
 * @reviewer pagolubev
 * @reviewer rodionov
 */


main() {
  Date date = new Date(1991, 8, 18);
  Expect.equals(Date.SUN, date.weekday);
  
  date = new Date(2011, 10, 4);
  Expect.equals(Date.TUE, date.weekday);
  
  date = new Date(1, 1, 1);
  Expect.equals(Date.SAT, date.weekday);
}
