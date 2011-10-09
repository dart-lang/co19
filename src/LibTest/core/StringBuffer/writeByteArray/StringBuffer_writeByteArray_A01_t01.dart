/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes [length] bytes into the output stream from
 * the specified array [buffer] starting at specified [offset].
 * @description Check that array is added to the buffer correctly
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.writeByteArray([0x61, 0x62, 0x63, 0x64], 0, 4);
  Expect.isTrue(sb.length == 4);
  Expect.isTrue(sb.toString() == "abcd");
  
  Array a = [-5, 0, 1000, 0x65, 0x66];
  sb.writeByteArray(a, 3, 2);
  Expect.isTrue(sb.length == 6);
  Expect.isTrue(sb.toString() == "abcdef");
  
  sb.writeByteArray([], 0, 0);
  Expect.isTrue(sb.length == 6);
  Expect.isTrue(sb.toString() == "abcdef");
  
  sb.writeByteArray([1, 2, 3, 4, 5], 0, 0);
  Expect.isTrue(sb.length == 6);
  Expect.isTrue(sb.toString() == "abcdef");
}
