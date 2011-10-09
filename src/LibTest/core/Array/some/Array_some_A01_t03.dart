/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the array satisfy the predicate [f]. 
 * @description Checks that ObjectNotClosureException exception is thrown.
 * @author vasya
 * @reviewer iefremov
 * @needsreview undocumented exception. add more tests
 */



main() {
  try {
    [1,2,3].some(null);
    Expect.fail("ObjectNotClosureException expected");
  } catch(ObjectNotClosureException e) {}

  bool x;
  try {
    [1,2,3].some(x);
    Expect.fail("ObjectNotClosureException expected");
  } catch(ObjectNotClosureException e) {}
}
