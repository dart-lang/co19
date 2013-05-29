/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void fillRange(int start, int end, [E fillValue])
 * It is an error if start..end is not a valid range pointing into the this.
 * @description Checks that it is an error if start..end is not a valid range
 * pointing into the this.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(List a) {
  try {
    a.first;
    Expect.fail("StateError expected when calling a.last");
  } on StateError catch(ok) {}
}

main() {
  List a=new List();

  a.fillRange(0, 0);

  try {
    a.fillRange(0, 1);
    Expect.fail("Error expected when calling fillRange with wrong range");
  } on RangeError catch(ok) {}
  
  a.add(1);
  a.fillRange(0, 1, 2);
  
  try {
    a.fillRange(1, 2);
    Expect.fail("Error expected when calling fillRange with wrong range");
  } on RangeError catch(ok) {}
}
