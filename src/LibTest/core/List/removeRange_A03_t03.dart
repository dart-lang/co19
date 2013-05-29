/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * It is an error if start.. end is not a valid range pointing into the this.
 * @description Checks that exception is thrown if start or end is not of type int.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(List l, int start, int end) {
  try {
    l.removeRange(start, end);
    Expect.fail("Error expected when calling List.removeRange()");
  } on Error catch(ok) {}   
}

main() {
  check(new List(),null,1);
  check(new List(),0,null);
  check(new List(),0,null);

  check(new List.from([]),null,1);
  check(new List.from([]),0,null);
  check(new List.from([]),0,null);

  check([],null,1);
  check([],0,null);
  check([],0,null);
}
