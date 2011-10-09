/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new array with the elements of this array that satisfy the predicate [f]. 
 * @description Checks that ObjectNotClosureException exception is thrown.
 * @author vasya
 * @reviewer iefremov
 * @needsreview Undocumented exception. What if array is empty? Add checks for other non-closure objects.
 */


main() {
  try {
    [null].filter(null);
    Expect.fail("ObjectNotClosureException expected");
  } catch(ObjectNotClosureException e) {}

  bool x;
  try {
    ["1","2"].filter(x);
    Expect.fail("ObjectNotClosureException expected");
  } catch(ObjectNotClosureException e) {}
}
