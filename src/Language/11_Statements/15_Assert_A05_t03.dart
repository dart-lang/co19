/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a lexically visible declaration named assert is in scope, an assert statement
 * assert e; is interpreted as an expression statement (assert(e));.
 * @description Checks that a function declaration named assert with fewer or more than 1 required
 * parameter still shadows the assert statement, even when the latter is used with a single argument.
 * @author rodionov
 * @reviewer iefremov
 * @needsreview issue 1731
 */

#import("../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    {
      bool flag = false;
      void assert() {}
  
      try {
        assert("it works!");
      } catch (ClosureArgumentMismatchException ok) {
        flag = true;
      }
      Expect.isTrue(flag);
    }
    
    {
      void assert(x, y) {}
      
      bool flag = false;
      try {
        assert("it works!");
      } catch (ClosureArgumentMismatchException ok) {
        flag = true;
      }
      Expect.isTrue(flag);
    }
  }
}
