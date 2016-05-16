/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * Returns a lazy Iterable with all elements that satisfy the predicate f.
 * @description Checks that something is thrown if the collection this method is
 * being invoked on is not empty and the argument is null, or if the argument's
 * type is incompatible with the required function type as long as the resulting
 * Iterable is iterated over.
 * @author vasya
 */
library where_A01_t04;
 
import "../../../Utils/expect.dart";
import "../../../Utils/dynamic_check.dart";

class A {
  A() {}
}

check(Iterable collection, var arg) {
  Iterable ret = collection.where(arg);
  Expect.throws(() {
    Iterator it = ret.iterator;
    while(it.moveNext()) {}
  });
}

test(Iterable create([Iterable content])) {
  if (!isCheckedMode()) {
    Iterable collection = create([1, 2, 3]);
    check(collection, null);
    check(collection, false);
    check(collection, 1);
    check(collection, "every");
    check(collection, [1, 2, 3]);
    check(collection, new A());
  }
}
