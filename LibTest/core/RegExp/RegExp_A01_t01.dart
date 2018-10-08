/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a regular expression.
 * @description Checks that it is possible to create a RegExp instance with
 * various valid arguments
 * @author rodionov
 */
 

main() {
  RegExp re = new RegExp(r".", multiLine: false, caseSensitive: true);
  re = new RegExp(r"[a-b]", multiLine: false, caseSensitive: true);
  re = new RegExp(r"1?", multiLine: false, caseSensitive: true);
  re = new RegExp(r"abc\u0042", multiLine: false, caseSensitive: true);
  re = new RegExp(r"(ajkfjka,af)", multiLine: false, caseSensitive: true);
  re = new RegExp(r"^\w\t\s$", multiLine: false, caseSensitive: true);
  re = new RegExp(r"a|b", multiLine: false, caseSensitive: true);
  re = new RegExp(r"\t", multiLine: false, caseSensitive: true);
}
