/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an array of the characters of this string.
 * @description Check that correct array is returned
 * @author msyabro
 */


void compareArrays(Array a1, Array a2) {
  Expect.isTrue(a1.length == a2.length);
  for(int i = 0; i < a1.length; i++) {
    Expect.isTrue(a1[i] == a2[i]);
  }
}

main() {
  String str = "abcdefghijklmnopqrstuvwxyz";
  Array a = str.splitChars();
  Expect.isTrue(a.length == 26);
  compareArrays(a, ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
  "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]);
   
   Expect.isTrue("".splitChars().isEmpty());
   
   a = "aaaaa".splitChars();
   Expect.isTrue(a.length == 5);
   compareArrays(a, ["a", "a", "a", "a", "a"]);
   
   a = "\u0000".splitChars();
   Expect.isTrue(s.length == 1);
   compareArrays(a, ["\u0000"]);
}
