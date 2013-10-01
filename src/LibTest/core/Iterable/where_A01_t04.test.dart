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
 * @description Checks that something is thrown if the collection this method is being invoked on
 * is not empty and the argument is null, or if the argument's type is incompatible with the required
 * function type as long as the resulting Iterable is iterated over.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
library where_A01_t04;
 
import "../../../Utils/expect.dart";

class A {
  A() {}
}

check(Iterable collection, var arg) {
  Expect.throws(() {
    Iterable ret = collection.where(arg);
    Iterator it = ret.iterator;
    while(it.moveNext()) {}
  });
}

test(Iterable create([Iterable content])) {
  Iterable collection=create(["1","2","3"]);
  check(collection, null);
  check(collection, false);
  check(collection, 1);
  check(collection, "every");
  check(collection, [1, 2, 3]);
  check(collection, new A());
}
