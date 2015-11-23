/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interpolated string "s1${e}s2" is equivalent to the
 * concatenation of the strings "s1", e.toString() and "s2".
 * @description Checks that an interpolated string "s1${e}s2" is equivalent to
 * the concatenation of the strings "s1", e.toString() and "s2".
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

func() {return "str";}

main() {
  StringBuffer buffer = new StringBuffer();

  buffer.write("List ");
  buffer.write([]);
  Expect.equals(buffer.toString(), "List ${[]}");

  buffer.clear();
  buffer.write("Number ");
  buffer.write(1 + 1);
  Expect.equals(buffer.toString(), "Number ${1 + 1}");

  buffer.clear();
  buffer.write("Result is ");
  buffer.write(func());
  buffer.write(" string");
  Expect.equals(buffer.toString(), "Result is ${func()} string");

  buffer.clear();
  buffer.write("!false is ");
  buffer.write(!false);
  Expect.equals(buffer.toString(), "!false is ${!false}");

  buffer.clear();
  buffer.write(2);
  buffer.write(" is greater than ");
  buffer.write(1);
  Expect.equals(buffer.toString(), "${2} is greater than ${1}");

  buffer.clear();
  buffer.write(3 - 2);
  buffer.write(1 * 2);
  Expect.equals(buffer.toString(), "${3 - 2}${1 * 2}");

  buffer.clear();
  buffer.write("a");
  buffer.write(" b c");
  Expect.equals(buffer.toString(), "${"a"} b c");

  buffer.clear();
  buffer.write(1);
  buffer.write(2);
  Expect.equals(buffer.toString(), "${"${1}" "${2}"}");
}
