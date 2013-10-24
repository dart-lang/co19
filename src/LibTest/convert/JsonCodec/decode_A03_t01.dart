/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object decode(String str, {reviver(key, value)})
 * Throws FormatException if the input is not valid JSON text.
 * @note undocumented
 * @description Checks that FormatException is thrown if the input is not valid JSON text.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";

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
  JsonCodec codec=new JsonCodec();
  
  for (String str in table) {
    Expect.throws(() {
      Object res = codec.decode(str);
    },
    (e) => e is FormatException,
    "bad string $str parsed"
    );
  }
}