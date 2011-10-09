/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] to each element of the collection
 * @description Try to pass not Function object as [f]
 * @author msyabro
 */


main() {
  DoubleLinkedList list = new DoubleLinkedList();
  
  try {
    list.forEach(null);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
  
  int x;
  try {
    list.forEach(x);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
}
