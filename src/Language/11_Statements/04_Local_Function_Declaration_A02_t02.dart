/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration statement of one of the forms id signature {statements}
 * or T id signature {statements} causes a new function named id to be added to
 * the innermost enclosing scope at the point immediately following the function
 * declaration statement.
 * @description Checks that local function is not accessible at the point preceedong the function
 * declaration statement.
 * @compile-error
 * @author kaigorodov
 */

main() {
  func(t1);
  var t1=new Object();
  void func(var t) {throw t;}
}