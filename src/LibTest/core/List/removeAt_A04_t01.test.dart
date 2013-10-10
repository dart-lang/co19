/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeAt(int index)
 * Throws an UnsupportedError, and doesn't remove the element, if the length of
 * the list cannot be changed.
 * @description Checks that an UnsupportedError is thrown if the index does not
 * point inside the list. Checks that the element is not removed.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List a, int index) {
  List a1=new List.from(a);
  bool failed=false;
  try {
    a.removeAt(index);
    failed=true;
  } on UnsupportedError catch(ok) {}
  Expect.isFalse(failed, "UnsupportedError expected");
  Expect.listEquals(a1, a);
}

main() {
  check(const [1,2], 0);
  check(const [1,2,3], 2);
  check(new List.from([1,2,3,4], growable:false), 3);
}
