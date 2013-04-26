/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a human readable string for this instance.
 * The returned string is constructed for the time zone of this instance. 
 * @description Checks various dates
 * @author hlodvig
 * @reviewer msyabro
 * @needsreview implementation based test. It would be good to define format of the returned string in the API
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("0001-01-01 00:00:00.000", new DateTime(1, 1, 1, 0, 0, 0, 0).toString());
  Expect.equals("2001-01-01 00:00:00.000", new DateTime(2001, 1, 1, 0, 0, 0, 0).toString());
  Expect.equals("2001-12-31 23:59:59.999", new DateTime(2001, 12, 31, 23, 59, 59, 999).toString());
  Expect.equals("99999-01-01 00:00:00.000", new DateTime(99999, 1, 1, 0, 0, 0, 0).toString());
}
