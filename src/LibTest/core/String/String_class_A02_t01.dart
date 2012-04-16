/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings do not contain surrogates:
 *    - if all characters of the String are 8 bits code points, the
 *      String is a list of bytes. Otherwise
 *    - if all code points can be represented in UTF-16 without
 *      surrogates, the String is a list of 16 bits code points.
 *      Otherwise
 *    - the String is stored in UTF-32, ie 32 bits code points.
 * @description Checks that String can be stored in UTF-32
 * @reviewer pagolubev
 * @author msyabro
 */

//TODO this belongs to LangGuideTest suite, if we're keeping it

main() {
  String str = "a"; //UTF-8;
  str = "$str\u1d02"; //UTF-16;
  str = "$str\u{10000}"; //UTF-32;
  
  Expect.equals(str, "\u0061\u1d02\u{10000}");
  Expect.equals(3, str.length);
}
