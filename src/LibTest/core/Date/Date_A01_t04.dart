/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a Date instance based on the individual parts.
 * The date is in the local time zone.
 * @description Checks that the local timezone is used.
 * @author iefremov
 */

main() {
  Date dt = new Date(2001, 1, 2, 3, 4, 5, 6);
  Expect.identical(dt, dt.toLocal());
}
