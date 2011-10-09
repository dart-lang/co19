/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new collection with the elements of this collection
 * that satisfy the predicate [f].
 * @description Try to pass not Function object as [f]
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  try {
    list.filter(null);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
  
  int x;
  try {
    list.filter(x);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
}
