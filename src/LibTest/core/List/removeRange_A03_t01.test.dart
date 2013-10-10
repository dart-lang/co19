/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * It is an error if start.. end is not a valid range pointing into the this.
 * @description Checks that an [ArgumentError] is thrown if [length] is negative.
 * @author vasya
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

check(list) {
  try {
    list.removeRange(0, -1);
    Expect.fail("ArgumentError expected when calling List.removeRange()");
  } on ArgumentError catch(ok) {}
}

main() {
  var a = new List();
  a.length = 1;
  check(a);
  check([1]);
  check(new List.from([1]));
}
