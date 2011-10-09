/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all items in [objects] to the buffer. Returns [this].
 * @description Try to pass null as [objects]
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  StringBuffer sb = new StringBuffer();
  
  try {
    sb.addAll(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
  
}
