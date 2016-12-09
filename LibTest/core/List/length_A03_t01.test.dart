/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void set length(int newLength)
 * If [newLength] is less than the current [length], drops extra entries 
 * at the end of this list.
 * @description Checks that entries are deleted from the list end.
 * @author varlax
 */
library length_A03_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  var a = create();
  a.addAll([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
  a.length = 10;
  Expect.listEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], a);

  a = create();
  a.addAll([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
  a.length = 10;
  Expect.listEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], a);

  a = create();
  for(var i in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]) {
    a.add(i);
  }
  a.length = 10;
  Expect.listEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], a);
}
