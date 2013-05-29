/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E singleWhere(bool test(E value))
 * If no or more than one element match then a StateError is thrown.
 * @description Checks that a StateError is thrown if no element match.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(List a, test(value)) {
  try {
    a.singleWhere(test);
    Expect.fail("StateError expected when calling a.singleWhere");
  } on StateError catch(ok) {}
}

main() {
  check([1,2,-3,4], (value)=>value==0);
  check(const[1,2,-5,-6], (value)=>value>2);
}
