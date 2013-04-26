/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a human readable string for this instance.
 * The returned string is constructed for the time zone of this instance. 
 * @description Checks that time zone influences the result string.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(millis) {
  Expect.notEquals(new DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toString(),
                   new DateTime.fromMillisecondsSinceEpoch(millis, isUtc: false).toString());
}

main() {
  check(5);
  check(0);
  check(1);
  check(-1);
  check(-100);
  check(6031769);
  check(60317690009);
  check(8640000000000000);
  check(-8640000000000000);
}
