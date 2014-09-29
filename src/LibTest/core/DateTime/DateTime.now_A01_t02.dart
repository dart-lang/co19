/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory DateTime.now()
 * Constructs a new DateTime instance with current date time value in the local time zone.
 * @description Checks that the dates constructed by [:DateTime.now():] increase all the time.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";

main(){
  DateTime start = new DateTime.now();
  DateTime prev = start;
  for(int i = 0; i < 100000; i++) {
    DateTime next = new DateTime.now();
    Expect.isTrue(prev.compareTo(next) <= 0);
    prev = next;
  }
}
