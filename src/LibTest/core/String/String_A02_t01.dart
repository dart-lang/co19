/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings do not contain surrogates:
 *    - if all characters of the String are 8 bits code points, the
 *      String is an array of bytes. Otherwise
 *    - if all code points can be represented in UTF-16 without
 *      surrogates, the String is an array of 16 bits code points.
 *      Otherwise
 *    - the String is stored in UTF-32, ie 32 bits code points.
 * @description Check that String can be stored in UTF-32
 * @author msyabro
 */


main() {
  String str = "a"; //UTF-8;
  str = str + "\x1d02"; //UTF-16;
  str = str + "\x10000"; //UTF-32;
  
  Expect.isTrue(str == "\x0061\x1d02\x10000");
  Expect.isTrue(str.length == 3);
}
