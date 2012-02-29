/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  An interpolated string ‘s1${e}s2’  is equivalent to ‘s1’ + e.toString() + ‘s2’.
 * @description Checks that an interpolated string ‘s1${e}s2’  is equivalent to ‘s1’ + e.toString() + ‘s2’.
 * @author msyabro
 * @reviewer rodionov
 */

func() {return "str";}

main() {
  Expect.equals('List ' + [].toString(), 'List ${[]}');
  Expect.equals('Number ' + (1 + 1).toString(), 'Number ${1 + 1}');
  Expect.equals('Result is ' + func().toString() + ' string', 'Result is ${func()} string');
  Expect.equals('!false is ' + (!false).toString(), '!false is ${!false}');
  Expect.equals(2.toString() + ' is greater than ' + 1.toString(), '${2} is greater than ${1}');
  Expect.equals((3 - 2).toString() + (1 * 2).toString(), '${3 - 2}${1 * 2}');
  Expect.equals("a".toString() + ' b c', '${"a"} b c');
  Expect.equals((1.toString() + 2.toString()).toString(), '${'${1}' + '${2}'}');
}
