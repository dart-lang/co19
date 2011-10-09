/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds) 
 * constructs a [DateTime] in local timezone
 * @description Check that timezone is local
 * @author hlodvig
 * @reviewer iefremov
 */

main(){
  DateTime dt = new DateTime(2001, 1, 2, 3, 4, 5, 6);
  Expect.equals(dt.timeZone, new TimeZone.local());
}
