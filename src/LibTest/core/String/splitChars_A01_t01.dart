/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a list of the characters of this string.
 * @description Checks that a correct list is returned
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";


void compareArrays(List a1, List a2) {
  Expect.isTrue(a1.length == a2.length);
  for(int i = 0; i < a1.length; i++) {
    Expect.isTrue(a1[i] == a2[i]);
  }
}

main() {
  compareArrays("abcdefghijklmnopqrstuvwxyz".splitChars(), ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                                                            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]);
   
  Expect.isTrue("".splitChars().isEmpty);
   
  compareArrays("aaaaa".splitChars(), ["a", "a", "a", "a", "a"]);
   
  compareArrays("\u0000".splitChars(), ["\u0000"]);
}
