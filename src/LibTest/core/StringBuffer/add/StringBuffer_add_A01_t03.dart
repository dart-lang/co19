/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [obj] to the buffer. Returns [this].
 * @description Try to pass not String object as [obj]
 * @author msyabro
 * @needsreview 
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.add(1);
  Expect.isTrue(sb.toString() == "1");
  
  sb.add(true);
  Expect.isTrue(sb.toString() == "1true");
  
  sb.add(null);
  Expect.isTrue(sb.toString() == "1truenull");
}
