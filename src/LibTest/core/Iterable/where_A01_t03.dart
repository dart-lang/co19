/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * This method returns a view of the mapped elements. 
 * As long as the returned Iterable is not iterated over, the supplied function f will not be invoked. 
 * Iterating will not cache results, and thus iterating multiple times over the the returned Iterable 
 * will invoke the supplied function f multiple times on the same element.
 * @description Checks that the given function is not executed and an empty
 * collection is returned if the list is empty.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer msyabro
 */


main() {
  Iterable a = [].where((var v){return true;});
  Iterator it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);
  
  a = [].where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);

  a = const [].where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);

  a = new List().where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);

  a = new List.from([]).where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);

  a = new Queue().where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);

  a = new Set().where((var v){Expect.fail("Should not be executed");});
  it = a.iterator;
  while(it.moveNext()) {}
  Expect.isTrue(a.isEmpty);
}
