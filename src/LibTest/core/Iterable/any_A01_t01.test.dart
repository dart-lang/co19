/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that this method works as specified.
 * @author pagolubev
 * @reviewer msyabro
 */
library any_A01_t01;
 
import "../../../Utils/expect.dart";

test1(Iterable create([Iterable content])) {
  bool foo(int x) { return x > 0; }

  Expect.isTrue(!create().any(foo));
  Expect.isTrue(!create([-1, -3, -11]).any(foo));
  Expect.isTrue(create([-1, -3, -11, 5]).any(foo));
  Expect.isTrue(create([-1, -3, -11, 5, 3]).any(foo));
}

test2(Iterable create([Iterable content])) {
  Iterable<int> s = create([1, -3, 10, 17]);

  Set<int> outer = new Set<int>();
  s.any((int x) {
    outer.add(x);
    Set<int> inner = new Set<int>();
    s.any((int y) {
      inner.add(y);
      return false;
    });
    Expect.isTrue(inner.containsAll(s));
    return false;
  });
  Expect.isTrue(outer.containsAll(s));
}

/* Checks that invoking any() doesn't change the set by itself.
 */
test3(Iterable create([Iterable content])) {
  bool foo(int x) { return x > 0; }
  Iterable s = create([-1, -3, -11]);
  List content=new List.from(s);
  Expect.isTrue(!s.any(foo));

  Expect.isTrue(s.length == 3);
  int k=0;
  for (Object o in s) {
    Expect.equals(content[k], o);
    k++;
  } 
}

test4(Iterable create([Iterable content])) {
  Expect.isTrue(create([0,1,2,3]).any((int e) { return (e > 1 && e < 3); } ));
  Expect.isFalse(create([1,2,3]).any((int e) { return (e < 0); } ));
  Expect.isTrue(create([null]).any((Object e) { return true; } ));
  Expect.isFalse(create([null]).any((Object e) { return false; } ));

  Expect.isTrue(create([null,1,"string",[], [null]]).any((Object e) { return (e is String); } ));

  
  bool f(Object e) { return e is List; }
  Expect.isTrue(create(["", "1", [], [null]]).any(f));

  bool f1 (int e) { return (e > 1); }
  Expect.isTrue(create([1,2,3,4]).any(f1));
}

//Checks that [some] calls [predicate] a [count] number of times
check5(List a, bool predicate(var e), int count) {
  int actualCount = 0;
  a.any((var e) {
    actualCount++;
    return predicate(e);
  });
  Expect.equals(count, actualCount);
}

// Checks that method is called for each element until the first true result
test5(Iterable create([Iterable content])) {
  Iterable s = create([1, 2, 3, 4, 5]);

  bool allTrue(var e) {
    return true;
  }
  check5(s, allTrue, 1);
  
  bool allFalse(var e) {
    return false;
  }
  check5(s, allFalse, 5);
  
  bool greaterThan3(var e) {
    return e > 3;
  }
  check5(s, greaterThan3, 4);
}


test(Iterable create([Iterable content])) {
  test1(create);
  test2(create);
  test3(create);
  test4(create);
}