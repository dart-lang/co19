/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisify the
 * predicate [f]. Returns false otherwise.
 * @description Tries to pass non-function object as argument [f]
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  
  //empty queue just ignores invalid arg
  int x = 0;
  list.every(null);
  list.every(x);

  list.addLast(1);
  
  try {
    list.every(null);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
  
  try {
    list.every(x);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
}
