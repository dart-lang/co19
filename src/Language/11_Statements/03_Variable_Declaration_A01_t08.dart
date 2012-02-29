/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks that a newly introduced variable may shadow the one declared
 * in an enclosing scope but doesn't replace it.
 * @author rodionov
 * @reviewer iefremov
 * @static-warning
 */

main() {
  String id = "foo";
  {
    int id = 1;
    Expect.equals(1, id);
  }
  Expect.equals("foo", id);
}
