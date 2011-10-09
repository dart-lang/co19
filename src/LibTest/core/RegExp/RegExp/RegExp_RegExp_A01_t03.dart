/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a regular expression.
 * @description Checks that using an invalid pattern results in IllegalJSRegExpException
 * @3rdparty sputnik-v1:S15.10.1_A1_T1.js-S15.10.1_A1_T16.js
 * @author rodionov
 * @reviewer iefremov
 * @needsreview undocumented behavior. Exception is unspecified.
 */


void check(String pattern) {
  bool fail = true;
  try {
    RegExp re = new RegExp(pattern, "");
    fail = true;
  } catch(var ok) {} //FIXME! specify type of exception.
  if(fail) {
    Expect.fail("Exception expected for pattern" + pattern);
  }
}

main() {
    check("{{");
    check("[a---z]");
    check("??");
    check("a**");
    check("**a");
    check("a***");
    check("a???");
    check("a+++");
    check("a++");
    check("++a");
    check("x{0,1}{1,}");
    check("x{1,}{1}");
    check("x{1,2}{1}");
    check("x{1}{1,}");
    check("??a");
    check("?a");

}
