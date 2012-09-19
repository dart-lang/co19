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
  RegExp re = new RegExp(@".", multiLine: false, ignoreCase: true);
  re = new RegExp(@"[a-b]", multiLine: false, ignoreCase: true);
  re = new RegExp(@"1?", multiLine: false, ignoreCase: true);
  re = new RegExp(@"abc\u0042", multiLine: false, ignoreCase: true);
  re = new RegExp(@"(ajkfjka,af)", multiLine: false, ignoreCase: true);
  re = new RegExp(@"^\w\t\s$", multiLine: false, ignoreCase: true);
  re = new RegExp(@"a|b", multiLine: false, ignoreCase: true);
  re = new RegExp(@"\t", multiLine: false, ignoreCase: true);
}
