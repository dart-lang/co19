/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Joins all the given strings to create a new string.
 * @description Checks that strings from the specified list are joined
 *              correctly using the specified separator.
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  Expect.equals("123", Strings.join([ "1", "2", "3" ], ""));
  Expect.equals("1,2,3", Strings.join([ "1", "2", "3" ], ","));
  Expect.equals("", Strings.join([], ","));
  Expect.equals("", Strings.join([], ""));
  Expect.equals("1", Strings.join([ "1" ], ","));
  Expect.equals("111", Strings.join([ "1", "1" ], "1"));
  Expect.equals("11", Strings.join([ "", "", "" ], "1"));
  Expect.equals("aa long separator bb", Strings.join([ "aa", "bb" ],
      " long separator "));
}
