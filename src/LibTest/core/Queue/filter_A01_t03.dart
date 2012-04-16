/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Tries to pass non-function object as [f]
 * @static-warning
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  int x;
  list.filter(null);
  list.filter(x);

  list.addLast(1);
  
  try {
    list.filter(null);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
  
  try {
    list.filter(x);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
}
