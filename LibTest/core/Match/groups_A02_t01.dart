/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws RangeError if one of indices is out of bounds
 * @description Checks that exception is thrown.
 * @author rodionov
 */
import "../../../Utils/expect.dart";
 
void check(String str, String pattern, List<int> groupIndices) {
  RegExp re = new RegExp(pattern, multiLine: false, caseSensitive: true);
  Match m = re.firstMatch(str);
  try {
    m.groups(groupIndices);
    Expect.fail("RangeError is expected");
  } on RangeError catch(e) {} 
}
 
main() {
  check("a", "a", [1, 1]);
  check("a", "a", [0, 1]);
  
  check("a", "(a)", [0, 1, 2]);
  check("abcdef", "(([a-z])*)", [3, 1, 1]);
  check("abcdef", "(([a-z])*)", [65536]);
  check("abcdef", "(([a-z])*)", [-1, 1]);
  check("abcdef", "(([a-z])*)", [-65536, 0, 0]);
}
