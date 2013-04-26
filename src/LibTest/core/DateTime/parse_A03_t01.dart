/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an exception if [formattedString] is in incorrect format.
 * @description Checks that an exception is thrown.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview #1878 Documentation does not specify the format and the thrown exception.
 */
import "../../../Utils/expect.dart";

bool failed=false;

check(String str) {
  try {
    DateTime dt=DateTime.parse(str);
    failed=true;
    print("$str parsed as $dt");
  } catch(ok) {
    //print("got $ok for $str");
  }
}

main(){
  check("just text");
  check('');
  check("2000/01/01 00/00/00/0");
  check("2000 01 01 00 00 00 0");
  check("23:23:23.23 2001-01-01");
  check("2001-01-01 00:00:00.###");
  check("2001-s-01 00:00:00.0");
  check("s-t-r i:n:g.");

  //Components are out of bounds
  check("2001-00-01 00:00:00.0");
  check("2001-13-01 00:00:00.0");
  check("2001-01-00 00:00:00.0");
  check("2001-01-32 00:00:00.0");
  check("2001-01-01 25:00:00.0");
  check("2001-01-01 00:60:00.0");
  check("2001-01-01 00:00:60.0");
  check("2001-01-01 00:00:00.100000");//one zero less it would be a correct date

  //Incorrect number of digits
  check("95-01-01 00:00:00.0");
  check("2001-1-01 00:00:00.0");
  check("2001-01-1 00:00:00.0");
  check("2001-01-01 0:00:00.0");
  check("2001-01-01 00:0:00.0");
  check("2001-01-01 00:00:0.0");

  //Missing components
  check("2000");
  check("2000-01");
  check("-01-01 00:00:00.0");
  check("2000-01-01 :00:00.0");
  check("2000-01-01 00::00.0");
  check("2000-01-01 00:00:.0");
  check("2000-01-01 00:00:00.");
  check("2000--1 0:0:0.0");
  check("2000-1- 0:0:0.0");
  check("--- ::.");

  //There is no support for these formats (yet?).
  check("2000-01-01 15:25:12.03+01:00");
  check("2000-01-01 15:25:12.00-02:00");
  check("1999-11-12 00:05:23+07:00");
  check("1985-W15-5 00:05:23");

  Expect.isFalse(failed);
}
