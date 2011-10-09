/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the buffer is empty.
 * @description Check that method returns true if the buffer is 
 * empty and false otherwise
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb.isEmpty());
  
  sb.add("");
  Expect.isTrue(sb.isEmpty());
  
  sb.add(null);
  Expect.isTrue(!sb.isEmpty());
  
  sb.clear();
  Expect.isTrue(sb.isEmpty());
  
  sb.add("abc");
  Expect.isTrue(!sb.isEmpty());
  
  sb = new StringBuffer();
  Expect.isTrue(sb.isEmpty());
}
