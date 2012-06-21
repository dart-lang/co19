/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a lexically visible declaration named assert is in scope, an assert statement
 * assert(e); is interpreted as an expression statement (assert(e));.
 * @description Checks that it is possible to have a function declaration named assert
 * invoke itself recursively using the same syntax as assert statement.
 * @author rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    int depth = 0;

    void assert(x) {
      if(depth < 5) {
        depth++;
        assert(null);
      }
    }

    depth = 0;
    assert("it works!");
    Expect.equals(5, depth);
    
    depth = 0;
    assert(null);
    Expect.equals(5, depth);
    
    depth = 0;
    assert(false);
    Expect.equals(5, depth);
  }
}
