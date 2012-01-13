/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const TimeZone.utc()
 * @description Checks that created instance is a TimeZone
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview Undocumented
 */


main() {
  Expect.isTrue(new TimeZone.utc() is TimeZone);
}
