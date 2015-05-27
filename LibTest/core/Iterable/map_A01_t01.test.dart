/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable map(f(E element))
 * Returns a lazy Iterable where each element e of this is replaced by the result of f(e).
 * This method returns a view of the mapped elements.
 * @description Checks that the resulting Iterable contains all the results of f(e).
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

f(var element) {
  return [element];
}
  
void checkResult(List a) {
  int count=0;
  Iterable mapIter=a.map(f);
  for (var el in mapIter) {
    Expect.listEquals(f(a[count]), el);
    count++;
  }
  Expect.equals(a.length, count);
}

main() {
  List a=new List();
  checkResult(a);
  a.add(22);
  checkResult(a);
  a.add(11);
  checkResult(a);
  a.add(11);
  checkResult(a);
  for (int k=-100; k<200; k++) {
    a.add(k);
  }
  checkResult(a);
}
