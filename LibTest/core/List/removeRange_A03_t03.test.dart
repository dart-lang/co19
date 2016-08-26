/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * An error occurs if start.. end is not a valid range for this.
 * @description Checks that exception is thrown if start or end is not of type int.
 * @author vasya
 * @reviewer varlax
 */
library removeRange_A03_t03;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List l, int start, int end) {
    var l = create();
    Expect.throws(() {
        l.removeRange(start, end);
      },
      (e) => e is RangeError
    );
 }
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
