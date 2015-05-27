/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> takeWhile(bool test(E value))
 * When the iterator encounters an element e that does not satisfy test,
 * it discards e and moves into the finished state. That is, it will not ask or
 * provide any more elements.
 * @description Checks that once an element does not satisfy the test,
 * the iterator stops testing.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart"	;

void check(List a, bool test(var element)) {
  int last=0;
  for (var element in a.takeWhile(test)) {
    Expect.equals(a[last], element);
    Expect.isTrue(test(element));
    last++;
  }
  if (last<a.length) {
    Expect.isFalse(test(a[last]));
  }
}

main() {
  List a0=[1,3,7,4,5,6];
  check(a0, (var element)=>element==1);
  check(a0, (var element)=>true);
  check(a0, (var element)=>false);
  check(a0, (var element)=>element>4);
  check(a0, (var element)=>element<4);
  check(a0, (var element)=>element==4);
}
