/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration statement of one of the forms
 * id signature {statements} or T id signature {statements} causes a new
 * function named id to be added to the innermost enclosing scope.
 * @description Checks that a local function declaration is accessible at the
 * point following the function declaration statement.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var t1 = new Object();
  void func(var t) {throw t;}

  try {
    func(t1);
    Expect.fail("should not get here");
  } on Object catch (e) {
    Expect.identical(t1, e);
  }
}
