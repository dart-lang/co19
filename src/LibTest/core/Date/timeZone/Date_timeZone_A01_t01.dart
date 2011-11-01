/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final TimeZone timeZone returns the timeZone of this instance. 
 * @description Checks that timeZone cannot be modified
 * @author hlodvig
 * @reviewer msyabro
 * @needsreview since there is no setters, NoSuchMethodException is raised
 */

main() {
  Date dt = new Date.now();
  try{
    dt.timeZone = new TimeZone.utc();
    Expect.fail("NoSuchMethodException should be thrown");
  } catch (NoSuchMethodException ok){}
}
