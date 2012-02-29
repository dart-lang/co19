/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Boolean conversion maps any object o into a boolean defined as
 * (bool v){
 *   assert(v != null);
 *   return v === true;
 * }(o)
 * @description Checks that objects that are not bool and not null are converted to false.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 1552
 */

#import("../../../Utils/dynamic_check.dart");

class A {}

main() {
  if(!isCheckedMode()) {
    Expect.isTrue(true && true);
    
    Expect.isFalse(new Object() && true);
    Expect.isFalse(0 && true);
    Expect.isFalse(1 && true);
    Expect.isFalse("" && true);
    Expect.isFalse([1, 2, 3] && true);
    Expect.isFalse({"k1": 1} && true);
    Expect.isFalse(new A() && true);
    Expect.isFalse((()=>1) && true);
    print((()=>1) && true);
  }
}