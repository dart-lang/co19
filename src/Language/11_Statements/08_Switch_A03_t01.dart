/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A switch statement switch (e) { case e1 : s1...case en : sn } is equivalent
 * to switch statement switch (e) { case e1 : s1...case en : sn default }. 
 * @description Checks that it is ok to have a switch statement with no default case,
 * which is essentially the same as an empty default case.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

test(value) {
  switch(value) {
    case 0:
      return 0;
      break;
    case 1: 
      return 1;
      break;
    case 2: 
      return 2;
      break;
  }  
}

main() {
  Expect.equals(0, test(0));
  Expect.equals(1, test(1));
  Expect.equals(2, test(2));
  Expect.equals(null, test(3));
}
