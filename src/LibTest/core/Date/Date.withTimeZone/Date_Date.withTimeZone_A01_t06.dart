/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone)
 *  constructs a [Date] instance based on the individual parts
 * @description Tries to pass non-int value as minutes.
 * @dynamic-type-error
 * @reviewer iefremov
 * @needsreview possibly merge with similar tests?
 * @author hlodvig
 */

main(){
  Date dt = new Date.withTimeZone(1, 1, 1, 1, "1", 1, 1, new TimeZone.utc());
}
