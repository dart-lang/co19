/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) constructs a new instance with 
 * the [timeZone] set to the local time-zone.
 * @description Checks that the timezone of the new instance is the local timezone.
 * @author hlodvig
 * @reviewer msyabro
 */

main(){
  Expect.equals(new TimeZone.local(), new Date.fromString(new Date.now().toString()).timeZone);
}
