/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable map(f(E element))
 * The transformed elements will not be cached. Iterating multiple times over the the
 * returned Iterable will invoke the supplied function f multiple times on the same element.
 * @description Checks that iterating multiple times over the the
 * returned Iterable will invoke the supplied function f multiple times on the same element.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

List<int> visited=new List<int>(200);

int f(int element) {
  visited[element]++;
  return element;
}
  
void checkResult(List<int> a, int expected) {
  int count=0;
  Iterable<int> mapIter=a.map(f);
  for (int el in mapIter) {
    count++;
  }
  Expect.equals(a.length, count);
  for (int k=0; k<200; k++) {
    Expect.equals(expected, visited[k]);
  }
}

main() {
  List<int> a=new List<int>();
  for (int k=0; k<200; k++) {
    a.add(k);
    visited[k]=0;
  }
  checkResult(a, 1);
  checkResult(a, 2);
  checkResult(a, 3);
}
