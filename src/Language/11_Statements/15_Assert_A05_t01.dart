/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a lexically visible declaration named assert is in scope, an assert statement
 * assert(e); is interpreted as an expression statement (assert(e));.
 * @description Checks that a function declaration named assert with a single required parameter
 * and possibly some optional parameters can shadow the assert statement.
 * @author rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    {
      bool flag = false;
      void assert(x) {
        flag = true;
      }
  
      flag = false;
      assert("it works!");
      Expect.isTrue(flag);
  
      flag = false;
      assert(() => null);
      Expect.isTrue(flag);
  
      flag = false;
      assert(true ? false: true);
      Expect.isTrue(flag);
    }
    
    {
      bool flag = false;
      int assert(x) {
        flag = true;
      }
  
      flag = false;
      assert("it works!");
      Expect.isTrue(flag);
  
      flag = false;
      assert(() => null);
      Expect.isTrue(flag);
  
      flag = false;
      assert(true ? false: true);
      Expect.isTrue(flag);
    }
  
    {
      bool flag = false;
      void assert(x, [y, z]) {
        flag = true;
      }
  
      flag = false;
      assert("it works!");
      Expect.isTrue(flag);
  
      flag = false;
      assert("it", "works!");
      Expect.isTrue(flag);
  
      flag = false;
      assert(() => null);
      Expect.isTrue(flag);
  
      flag = false;
      assert(true ? false: true);
      Expect.isTrue(flag);
  
      flag = false;
      assert(true, false, true);
      Expect.isTrue(flag);
    }
  }
}
