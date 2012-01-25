/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a regular expression.
 * @description Checks that it is possible to create a RegExp instance with various valid arguments
 * @author rodionov
 * @reviewer iefremov
 * @reviewer msyabro
 */
 

main() {
  RegExp re = new RegExp(@".", false, true);
  re = new RegExp(@"[a-b]", false, false);
  re = new RegExp(@"1?", true, true);
  re = new RegExp(@"abc\u0042", false, true);
  re = new RegExp(@"(ajkfjka,af)", false, false);
  re = new RegExp(@"^\w\t\s$", false, false);
  re = new RegExp(@"a|b", true, true);
  re = new RegExp(@"\t", true, false);
}
