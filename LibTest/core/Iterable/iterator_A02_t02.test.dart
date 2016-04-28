/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * Returns a new Iterator that allows iterating the elements of this Iterable.
 * Iterable classes may specify the iteration order of their elements (for
 * example List always iterate in index order), or they may leave it unspecified
 * (for example a hash-based Set may iterate in any order).
 *
 * Each time iterator is read, it returns a new iterator, which can be used to
 * iterate through all the elements again. The iterators of the same iterable
 * can be stepped through independently, but should return the same elements in
 * the same order, as long as the underlying collection isn't changed.
 *
 * Modifying the collection may cause new iterators to produce different
 * elements, and may change the order of existing elements. A List specifies its
 * iteration order precisely, so modifying the list changes the iteration order
 * predictably. A hash-based Set may change its iteration order completely when
 * adding a new element to the set.
 *
 * Modifying the underlying collection after creating the new iterator may cause
 * an error the next time Iterator.moveNext is called on that iterator. Any
 * modifiable iterable class should specify which operations will break
 * iteration.
 * @description Checks that iterator iterates all elements of this Iterable.
 * Test not empty collection
 * @author sgrekhov@unipro.ru
 */
library iterator_A02_t02;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable it = create([1, 2, 3, null, 10, 5]);
  List l = new List();
  Iterator i = it.iterator;
  while(i.moveNext()) {
    l.add(i.current);
  }
  Expect.equals(it.length, l.length);
  for (int i = 0; i < it.length; i++) {
    Expect.equals(it.elementAt(i), l[i]);
  }
}
