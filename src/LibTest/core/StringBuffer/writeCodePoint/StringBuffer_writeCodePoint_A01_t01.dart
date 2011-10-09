/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified code point [codePoint].
 * @description Check that code point is added to the buffer
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  
  sb.writeCodePoint(0x0061);
  Expect.isTrue(sb.toString() == "a");
  
  sb.writeCodePoint(97);
  Expect.isTrue(sb.toString() == "aa");
  
  sb.writeCodePoint('\u0061');
  Expect.isTrue(sb.toString() == "aaa");
  
  sb.writeCodePoint('\u0001');
  Expect.isTrue(sb.toString() == "aaa\u0001");
}
