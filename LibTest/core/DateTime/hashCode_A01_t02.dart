/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int hashCode
 * Get a hash code for this object.
 * docs inherited from Object:
 * All objects have hash codes. Hash codes are guaranteed to be the same for objects that are
 * equal when compared using the equality operator ==. 
 * @description Checks that hashCode is int.
 * Checks that if hashcodes are different, objects are different. 
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(t1, t2) {
  DateTime date1=new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true);
  DateTime date2=new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true);
  var h1=date1.hashCode;
  var h2=date2.hashCode;
  Expect.isTrue(h1 is int);
  Expect.isTrue(h2 is int);
  if (h1!=h2) {
    Expect.notEquals(date1, date2);
  }
}

main() {
  check(0, 1);
  check(1, 0);
  check(603176900008, 603176900009);
  check(603176900009, 603176900008);
  check(100, 603176900009);
  check(603176900009, 100);
  check(100, -100);
}
