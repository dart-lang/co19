/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an exception if [formattedString] is in incorrect format.
 * @description Checks that the exception is thrown.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Documentation does not specify the format and the thrown exception.
 */

check(String str) {
  bool fail = false;
  try {
    new Date.fromString(str);
    fail = true;
  } catch(var ok) {
  }
  if(fail) {
    Expect.fail("Some exception is expected");
  }
}

main(){
  check("just text");
  check("2000");
  check("2000-1");
  check("2000-1-1");
  check("2000-1-1 0");
  check("2000-1-1 0:0");
  check("2000/1/1 0/0/0/0");
  check("2000 1 1 0 0 0 0");
  check("2000-1-1T0:0:0.0Z");
  check("23:23:23.23 2001-01-01");
}
