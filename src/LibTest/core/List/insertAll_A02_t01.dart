/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void insertAll(int index, Iterable<E> iterable)
 * It is an error if the index does not point inside the list or at the position
 * after the last element.
 * @description Checks that it is an error if the index does not point at the position
 * after the last element.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List a, int index, Iterable elements) {
  bool failed=false;
  try {
    a.insertAll(index, elements);
    failed=true;
  } on Error catch(ok) {}
  Expect.isFalse(failed, "an error expected");
}

main() {
  List a0=[1,3,3,4,5,6];
  check(new List.from(a0), -1, a0);
  check(new List.from(a0), -1000, a0);
  check(new List.from(a0), a0.length+1, a0);
  check(new List.from(a0), a0.length*1000, a0);
}
