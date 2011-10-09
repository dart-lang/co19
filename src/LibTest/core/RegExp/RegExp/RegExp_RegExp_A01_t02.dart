/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a regular expression.
 * @description Checks that using invalid flags argument results in exception.
 * @author rodionov
 * @reviewer iefremov
 * @needsreview
 */
 

main() {
  bool fail = false;
  try {
    RegExp re = const RegExp(".", "ii");
    fail = true;
  } catch(var ok) { } //FIXME!
  if(fail) {
    Expect.fail("Some Exception expected");
  }

  fail = false;
  try {
    RegExp re = const RegExp(".", ".");
    fail = true;
  } catch (var ok) {} //FIXME!
  if(fail) {
    Expect.fail("Some Exception expected");
  }
}
