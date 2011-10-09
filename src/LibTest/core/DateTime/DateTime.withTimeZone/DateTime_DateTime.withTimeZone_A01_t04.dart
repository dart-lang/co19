/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone) 
 *  constructs a [DateTime] instance based on the individual parts
 * @description Try to pass non-int value as day
 * @dynamic-type-error
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview possibly merge with similar tests?
 */

main(){
  DateTime dt = new DateTime.withTimeZone(1, 1, "1", 1, 1, 1, 1, new TimeZone.utc());
}
