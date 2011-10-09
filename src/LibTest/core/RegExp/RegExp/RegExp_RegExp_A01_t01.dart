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
 */
 

main() {
  RegExp re = const RegExp(@".", "i");
  re = const RegExp(@"\t", "m");
  re = const RegExp(@"[a-b]", "g");
  re = const RegExp(@"1?","mig");
  re = const RegExp(@"abc\u0042", "i");
  re = const RegExp(@"(ajkfjka,af)", "");
  re = const RegExp(@"^\w\t\s$", "");
  re = const RegExp(@"a|b", "gmi");
}
