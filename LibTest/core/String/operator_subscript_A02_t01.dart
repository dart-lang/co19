/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an RangeError if [index] is out of bounds.
 * @description Checks that passing an argument that is out of this string's
 * valid index range results in an RangeError
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  String str = "s";
  String str2 = "string";
  
  checkIndexOOR("", 0);
  checkIndexOOR(str, -1);
  checkIndexOOR(str2, str2.length);
  checkIndexOOR(str2, 0x80000000);
  checkIndexOOR(str2, 0x7fffffff);
}

void checkIndexOOR(String str, int index) {
  try {
    String foo = str[index];
    Expect.fail("RangeError is expected");
  } on RangeError catch(e) {}
}
