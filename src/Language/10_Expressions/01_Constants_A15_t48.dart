/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All possible constant expressions are prescribed in assertions
 * 01_Constants_A01 - 01_Constants_A14 and 01_Constants_A19.
 * There are no other constant expressions.
 * @description Checks that an instance method is not a constant expression.
 * @compile-error
 * @author kaigorodov
 * @reviewer msyabro
 */

class Bad {
  void m() {}

 test() {
   var list = const [m]; //a constant list can contain only constant expressions
 }
}


main() {
  try {
    Bad b=new Bad();
    b.test();
  } catch(x) {}
}
