/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable expand(Iterable f(E element))
 * Expand each element of this Iterable into zero or more elements.
 * The resulting Iterable will run through the elements returned by f for each
 * element of this, in order.
 * @description Checks that the length of resulting Iterable equals  the total number
 * of inserted values
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List a) {
  int count=0;
  Iterable expanded=a.expand((var element) {
    List res=new List();
    for (int k=0; k<element; k++) {
      res.add(k);
      count++;
    }
    return res;
  });
  int expanded_length=expanded.length; // force lazy evaluation
  Expect.equals(count, expanded_length);
}

main() {
  List a=new List();
  check(a);
  a.add(2);
  check(a);
  a.add(1);
  check(a);
  a.add(1);
  check(a);
}
