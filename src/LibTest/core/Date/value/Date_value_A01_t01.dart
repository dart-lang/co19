/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int value returns milliseconds from 1970-01-01T00:00:00Z (UTC). 
 * @description Checks that [value] cannot be modified
 * @author hlodvig
 * @reviewer msyabro
 * @needsreview since there are no setters, NoSuchMethodException is raised
 */

main() {
  Date dt = new Date.now();
  try{
    dt.value = 1;
    Expect.fail("NoSuchMethodException should be thrown");
  } catch (NoSuchMethodException ok){}
}
