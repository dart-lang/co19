/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic parse(String json, [reviver(key, value)])
 * Throws FormatException if the input is not valid JSON text.
 * @description Checks that FormatException is thrown if the input is not valid JSON text.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";

List<String> table = [
'',
'a',
'-',
':',
'[',
'{',
'[1,2,3:33]',
'{"a":a, "b"}',
'{"a":, "b":b}',
'{"a"a, "b":b}',
'{"a":a "b":b}',
'[1,2,{3:33}]',
'[1,2,3}',
'{1,2,3]',
'{"a":[], []:b}',
'{"a":[], 1:b}',
'{"a":[], {}:b}',
];

main() {
  for (String str in table) {
    bool failed=false;
    try {
      Object res = parse(str);
      print("bad string $str parsed");
      failed=true;
    } on FormatException catch (ok) {
    }
    Expect.isFalse(failed);
  }
}