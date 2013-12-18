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
 * @description Checks that predicate exception goes through to the caller when the result of this method
 * is iterated over and the target collection is not empty.
 * @author varlax
 * @reviewer iefremov
 */
library where_A01_t05;
 
import "../../../Utils/expect.dart";

check(Iterable a, bool predicate(var e), exc) {
  int actualCount = 0;
  Iterable ret = a.where((var e) {
    actualCount++;
    return predicate(e);
  });
  Iterator it = ret.iterator;
  Expect.throws(
    () {
      while(it.moveNext()) {}
    },
    (e) {return identical(exc, e);}
  );
  Expect.equals(1, actualCount);
}

test(Iterable create([Iterable content]), {bool isSet:false}) {
  Iterable collection=create([1, 2, 3, 4, 5]);

  bool allTrue(var e) {
    throw true;
  }
  check(collection, allTrue, true);
  
  bool allFalse(var e) {
    throw false;
  }
  check(collection, allFalse, false);
  
  bool lessThan3(var e) {
    throw 3;
  }
  check(collection, lessThan3, 3);
}
