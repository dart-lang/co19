/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that the line is recorded correctly when the
 *              FallThroughError is raised the intended way (control reaching
 *              the end of a non-empty switch statement's case).
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
 
main() {
  try {
    switch(false) {
      case true:
        print("great!");
        break;
      case false:
        print("not so great!");
      default: // this is line 24
        print("just awesome!");
        break;
    }
    Expect.fail("FallThroughError expected");
  } catch (FallThroughError e) {
    Expect.equals(24, e.line);
  }
}

