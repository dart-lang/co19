/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion returns -1 if the string less then [other],
 * 1 if he string greater then [other]
 * 0 if strings are equal
 * @description Check that method returns correct value
 * @author msyabro
 */


main() {
  Expect.isTrue("".compareTo("") == 0);
  Expect.isTrue("".compareTo("a") == -1);
  
  Expect.isTrue("ABC".compareTo("abc") == -1);
  Expect.isTrue("abc".compareTo("ABC") == 1);
  
  Expect.isTrue("a".compareTo("b") == -1);
  Expect.isTrue("a".compareTo("a") == 0);
  Expect.isTrue("baaaaaaaaaaaaa".compareTo("a") == 1);
  
  Expect.isTrue("\uffff".compareTo("\ufffe") == 1);
}
