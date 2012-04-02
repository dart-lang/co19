/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  An interpolated string 's1${e}s2' is equivalent to the
 * concatenation of the strings 's1', e.toString() and 's2'.
 * @description Checks that an interpolated string ‘s1${e}s2’ is equivalent to the
 * concatenation of the strings 's1', e.toString() and 's2'.
 * @author msyabro
 * @reviewer rodionov
 */

func() {return "str";}

main() {
  StringBuffer buffer = new StringBuffer();

  buffer.add('List ');
  buffer.add([]);
  Expect.equals(buffer.toString(), 'List ${[]}');

  buffer.clear();
  buffer.add('Number ');
  buffer.add(1 + 1);
  Expect.equals(buffer.toString(), 'Number ${1 + 1}');

  buffer.clear();
  buffer.add('Result is ');
  buffer.add(func());
  buffer.add(' string');
  Expect.equals(buffer.toString(), 'Result is ${func()} string');

  buffer.clear();
  buffer.add('!false is ');
  buffer.add(!false);
  Expect.equals(buffer.toString(), '!false is ${!false}');

  buffer.clear();
  buffer.add(2);
  buffer.add(' is greater than ');
  buffer.add(1);
  Expect.equals(buffer.toString(), '${2} is greater than ${1}');

  buffer.clear();
  buffer.add(3 - 2);
  buffer.add(1 * 2);
  Expect.equals(buffer.toString(), '${3 - 2}${1 * 2}');

  buffer.clear();
  buffer.add("a");
  buffer.add(' b c');
  Expect.equals(buffer.toString(), '${"a"} b c');

  buffer.clear();
  buffer.add(1);
  buffer.add(2);
  Expect.equals(buffer.toString(), '${'${1}' '${2}'}');
}
