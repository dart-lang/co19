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
 * Concatenation is done at compile time.
 * @author kaigorodov
 * @reviewer iefremov
 */
import '../../../../Utils/expect.dart';

func() {return "str";}

main() {
  Expect.equals("List ""[]", "List ${[]}");
  Expect.equals("Number ""${1 + 1}", "Number ${1 + 1}");
  Expect.equals("Result is ""${func()}"" string",
      "Result is ${func()} string");
  Expect.equals("!false is ""${!false}", "!false is ${!false}");
  Expect.equals("${2}"" is greater than ""${1}", "${2} is greater than ${1}");
  Expect.equals("${3 - 2}""${1 * 2}", "${3 - 2}${1 * 2}");
  Expect.equals("${"a"}"" b c", "${"a"} b c");
}

