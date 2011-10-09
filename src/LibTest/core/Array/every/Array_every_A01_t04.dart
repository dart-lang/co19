/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every element of the array satisfy the predicate [f]. Returns false otherwise.
 * @description Checks that ObjectNotClosureException exception is thrown if the argument
 * is not a closure.
 * @author vasya
 * @reviewer iefremov
 * @needsreview Exception is undocumented.
 */




main() {
  Array<String> a = ["1","2","3"];
  try {
    a.every(null);
    Expect.fail("ObjectNotClosureException expected when calling a.every()");
  } catch(ObjectNotClosureException e) {}

  bool x;
  try {
    a.every(x);
    Expect.fail("ObjectNotClosureException expected when calling a.every().");
  } catch(ObjectNotClosureException e) {}  
}
