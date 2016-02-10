/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a FormatException if the input cannot be parsed
 * @description Checks that a FormatException exception is thrown if the input
 * cannot be parsed.
 * @author msyabro
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main(){
  Expect.throws(() {DateTime.parse(null);}, (e) => e is ArgumentError);

  Expect.throws(() {DateTime.parse("just text");}, (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("");}, (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000/01/01 00/00/00/0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000 01 01 00 00 00 0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("23:23:23.23 2001-01-01");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-01-01 00:00:00.###");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-s-01 00:00:00.0");},
      (e) => e is FormatException);

  //Incorrect number of digits
  Expect.throws(() {DateTime.parse("95-01-01 00:00:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-1-01 00:00:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-01-1 00:00:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-01-01 0:00:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-01-01 00:0:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2001-01-01 00:00:0.0");},
      (e) => e is FormatException);

  //Missing components
  Expect.throws(() {DateTime.parse("2000");}, (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000-01");}, (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("-01-01 00:00:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000-01-01 :00:00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000-01-01 00::00.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000-01-01 00:00:.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000-01-01 00:00:00.");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000--1 0:0:0.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("2000-1- 0:0:0.0");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("--- ::.");},
      (e) => e is FormatException);

  // wrong characters
  Expect.throws(() {DateTime.parse("1985-W11-11 00:05:23");},
      (e) => e is FormatException);
  Expect.throws(() {DateTime.parse("1985-01-01 00:05:23.123F");},
      (e) => e is FormatException);
}
