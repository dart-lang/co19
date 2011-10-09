/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Closes the input stream and releases all system resources.
 * @description Check that method closes the input stream
 * @author msyabro
 * @needsreview It's undocumented what type of exception should be thrown
 */


main() {
  StringBuffer sb = new StringBuffer("string");
  sb.close();
  try {
    sb.writeString("string");
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  try {
    sb.writeByte(0);
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  try {
    sb.writeByteArray([1], 0, 1);
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  try {
    sb.writeCodePoint(0);
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  try {
    sb.append("string");
    Expect.fail("Exception is expected");
  } catch(Object e) {}
  
  try {
    sb.appendAll(["string1", "string2", "string3"]);
    Expect.fail("Exception is expected");
  } catch(Object e) {}
}
